"
I am a shopping cart that uses Stripe to process the transaction
"
Class {
	#name : #StripeShoppingCart,
	#superclass : #MCWLayoutComponent,
	#instVars : [
		'cartVisible',
		'cartState',
		'cartItems'
	],
	#category : #Stripe
}

{ #category : #testing }
StripeShoppingCart class >> isVoyageRoot [

	^ true
]

{ #category : #stripe }
StripeShoppingCart >> actionCancel [

	self mcwApplicationGet logString: 'Cancel'
]

{ #category : #stripe }
StripeShoppingCart >> actionSuccess [

	self mcwApplicationGet logString: 'Success'.

	self cartState: self cartStatePaid
]

{ #category : #rendering }
StripeShoppingCart >> addValidatedForm [

	^ self
]

{ #category : #rendering }
StripeShoppingCart >> asComponent [

	^ self
]

{ #category : #accessing }
StripeShoppingCart >> cartItems [
	^ cartItems
]

{ #category : #accessing }
StripeShoppingCart >> cartItems: anObject [
	cartItems := anObject
]

{ #category : #accessing }
StripeShoppingCart >> cartItemsAdd: aProduct [

	(aProduct includesKey: 'images') ifTrue: [
		| url |
		url := aProduct at: 'images'.
		url isArray ifFalse: [ aProduct at: 'images' put: (Array with: url) ] ].

	self cartItems add: aProduct
]

{ #category : #accessing }
StripeShoppingCart >> cartItemsClear [

	self cartState: self cartStateShopping.

	self cartItems: OrderedCollection new.
	"self cartItems: (OrderedCollection with: Object new)"
]

{ #category : #accessing }
StripeShoppingCart >> cartState [
	^ cartState
]

{ #category : #accessing }
StripeShoppingCart >> cartState: anObject [
	cartState := anObject
]

{ #category : #accessing }
StripeShoppingCart >> cartStatePaid [

	^ #Paid
]

{ #category : #accessing }
StripeShoppingCart >> cartStateShopping [

	^ #Shopping
]

{ #category : #accessing }
StripeShoppingCart >> cartValues [
	| subtotal shipping tax |

	subtotal := self cartItems inject: 0.0 into: [ :sum :each |  sum + ((each hash \\ 10000) / 100.0) ].
	shipping := self cartItems ifEmpty: [ 0.0 ] ifNotEmpty: [ 10.00 ].
	tax := subtotal * 0.1.
	
	^ IdentityDictionary new
		at: #total put: (subtotal + shipping + tax);
		at: #subtotal put: subtotal;
		at: #shipping put: shipping;
		at: #tax put: tax;
		yourself
]

{ #category : #accessing }
StripeShoppingCart >> cartVisible [
	^ cartVisible
]

{ #category : #accessing }
StripeShoppingCart >> cartVisible: anObject [
	cartVisible := anObject
]

{ #category : #stripe }
StripeShoppingCart >> createCheckoutSessionRequest: html json: json [
	| publicServerUrl successUrl cancelUrl client responseJsonString responseJson |

	publicServerUrl := WAUrl absolute: (DockerDeploy current configsAt: DockerDeploy defaultConfigName atKey: 'publicServerUrl').
	successUrl := html urlForAction: [ self actionSuccess ] absolute: publicServerUrl.
	cancelUrl := html urlForAction: [ self actionCancel ] absolute: publicServerUrl.
"
self mcwApplicationGet logString: successUrl printString.
self mcwApplicationGet logString: cancelUrl printString.
"

	(client := ZnClient new)
		https;
		host: 'api.stripe.com';
		addPath: (Array with: 'v1' with: 'checkout' with: 'sessions');
		username: StripeAPI current stripeSecretKey password: '';
		formAt: 'success_url' put: successUrl printString;
		formAt: 'cancel_url' put: cancelUrl printString;
		formAt: 'payment_method_types[0]' put: 'card';
		formAt: 'line_items[0][price]' put: 'price_0IlPNK6QgJXWI9aTI0CX40eD';
		formAt: 'line_items[0][quantity]' put: '2';
		formAt: 'mode' put: 'payment';
		yourself.

	responseJsonString := client post.
	responseJson := WAJsonParser parse: responseJsonString.
	(responseJson includesKey: 'id')
		ifFalse: [ self layout app logString: 'Stripe error response: ', responseJsonString ].

	^ json string: responseJsonString
]

{ #category : #initialization }
StripeShoppingCart >> initialize [

	super initialize.

	self cartVisible: false.
	self cartItemsClear.
]

{ #category : #utility }
StripeShoppingCart >> printAsMoney: aValue [

	^ '$', (aValue printShowingDecimalPlaces: 2)
]

{ #category : #rendering }
StripeShoppingCart >> renderCartHeaderOn: html [

	html div: [
		self renderDismissButtonOn: html.
		html space; space.
		self renderCartSummaryOn: html ]
]

{ #category : #rendering }
StripeShoppingCart >> renderCartItemImagesOn: html [

	self cartItems do: [ :eachItem |			
		html image "mdcImageList__image;"
			style: 'width: 48px; height: 48px';
			url: (eachItem at: 'images') first ]
]

{ #category : #rendering }
StripeShoppingCart >> renderCartItemsOn: html [

	html unorderedList mdcList; mdcTheme_surface; mdcList_twoLine; mdcList_imageList; with: [
		self cartItems do: [ :eachItem |			
			html listItem mdcListItem; with: [
				html span mdcListItem__graphic; with: [
					html image mdcImageList__image; "style: 'width: 64px; height: 64px';"
						url: (eachItem at: 'images') first ].
				html span mdcListItem__text; with: [
					html span mdcListItem__primaryText; with: (eachItem at: 'id').
					html span mdcListItem__secondaryText; with: (eachItem at: 'name') ] ] ] ]
]

{ #category : #rendering }
StripeShoppingCart >> renderCartLine: lineItemName total: lineItemValue on: html [

	html span mdcTypography_body1; with: lineItemName.
	html text: ' . . . '.
	html span mdcTypography_body1; with: lineItemValue.
	html break
]

{ #category : #rendering }
StripeShoppingCart >> renderCartOn: html [

	self renderCartHeaderOn: html.
	
	self cartState = self cartStateShopping
		ifTrue: [ ^ self renderCartShoppingOn: html ].
		
	self cartState = self cartStatePaid
		ifTrue: [ ^ self renderCartPaidOn: html ].
		
	html text: 'Cart error'
]

{ #category : #rendering }
StripeShoppingCart >> renderCartPaidOn: html [

	self renderCartTotalsOn: html.
	html span mdcTypography_headline6; with: 'Payment successful !'.
	self renderClearCartButtonOn: html
]

{ #category : #rendering }
StripeShoppingCart >> renderCartShoppingOn: html [

	self renderCartItemsOn: html.
	self renderCartTotalsOn: html.
	self renderCheckoutButtonOn: html.
	self renderClearCartButtonOn: html
]

{ #category : #rendering }
StripeShoppingCart >> renderCartSummaryOn: html [

	html span mdcTypography_subtitle1; with: [
		html text: 'CART'; space; space; space.
		html text: self cartItems size printString.
		html text: (self cartItems size = 1 ifTrue: [ ' ITEM' ] ifFalse: [ ' ITEMS' ]) ].
]

{ #category : #rendering }
StripeShoppingCart >> renderCartTotalsOn: html [
	| cartValues |

	cartValues := self cartValues.

	self renderCartLine: 'TOTAL' total: (self printAsMoney: (cartValues at: #total)) on: html.
	self renderCartLine: 'Subtotal' total: (self printAsMoney: (cartValues at: #subtotal)) on: html.
	self renderCartLine: 'Shipping' total: (self printAsMoney: (cartValues at: #shipping)) on: html.
	self renderCartLine: 'Tax' total: (self printAsMoney: (cartValues at: #tax)) on: html.
]

{ #category : #rendering }
StripeShoppingCart >> renderCheckoutButtonOn: html [

	html button
		mdcButton;
		mdcButton_raised;
		style: 'margin-bottom: 8px; width: 100%';
		onClick: (self stripeRedirectScriptOn: html);
		with: 'Proceed to checkout'
]

{ #category : #rendering }
StripeShoppingCart >> renderClearCartButtonOn: html [

	html anchor
		mdcButton;
		mdcButton_raised;
		style: 'width: 100%';
		callback: [ self cartItemsClear ];
		with: 'Clear cart'
]

{ #category : #rendering }
StripeShoppingCart >> renderContentOn: html [

	html div
		style: 'padding: 8px';
		style: 'background: var(--mdc-theme-secondary)';
		with: [
			self cartVisible
				ifTrue: [ self renderCartOn: html ]
				ifFalse: [ self renderShowCartButtonOn: html ] ]

	
]

{ #category : #rendering }
StripeShoppingCart >> renderDismissButtonOn: html [

	html anchor mdcMaterialIcons; mdcIconButton; "mdcButton_raised;"
		callback: [ self cartVisible: false ];
		with: [ html div mdcButton__ripple; with:'expand_less' ]
]

{ #category : #rendering }
StripeShoppingCart >> renderShowCartButtonOn: html [

	html anchor mdcMaterialIcons; mdcIconButton; "mdcButton_unelevated;" "mdcButton_raised;"
		callback: [ self cartVisible: true ];
		with: [ html div mdcButton__ripple; with: 'shopping_cart' ].

	self renderCartItemImagesOn: html
]

{ #category : #stripe }
StripeShoppingCart >> serverUrl [

	^ self mcwPublicServerUrl
		ifNotNil: [ :value | value ]
		ifNil: [ self error: 'Public server URL not set' ]
]

{ #category : #stripe }
StripeShoppingCart >> stripeRedirectScriptOn: html [

	^ html jQuery getJson 
		json: [ :json | self createCheckoutSessionRequest: html json: json ];
		onSuccess: (html javascript << (JSStream new
				nextPutAll: 'Stripe(''';
				nextPutAll: StripeAPI current stripePublishableKey;
				nextPutAll: ''').redirectToCheckout({sessionId: JSON.parse(arguments[0]).id})';
				yourself);
			yourself)
]
