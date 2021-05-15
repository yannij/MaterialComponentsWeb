Class {
	#name : #ShrineShoppingCart,
	#superclass : #MCWLayoutComponent,
	#instVars : [
		'cartVisible',
		'cartState',
		'cartItems'
	],
	#category : #'Material-Study-Shrine'
}

{ #category : #stripe }
ShrineShoppingCart >> actionCancel [

	self mcwApplicationGet logString: 'Cancel'
]

{ #category : #stripe }
ShrineShoppingCart >> actionSuccess [

	self mcwApplicationGet logString: 'Success'.

	self cartState: self cartStatePaid
]

{ #category : #rendering }
ShrineShoppingCart >> addValidatedForm [

	^ self
]

{ #category : #rendering }
ShrineShoppingCart >> asComponent [

	^ self
]

{ #category : #accessing }
ShrineShoppingCart >> cartItems [
	^ cartItems
]

{ #category : #accessing }
ShrineShoppingCart >> cartItems: anObject [
	cartItems := anObject
]

{ #category : #accessing }
ShrineShoppingCart >> cartItemsAdd: aProduct [

	self cartItems add: aProduct
]

{ #category : #accessing }
ShrineShoppingCart >> cartItemsClear [

	self cartState: self cartStateShopping.

	self cartItems: OrderedCollection new.
	"self cartItems: (OrderedCollection with: Object new)"
]

{ #category : #accessing }
ShrineShoppingCart >> cartState [
	^ cartState
]

{ #category : #accessing }
ShrineShoppingCart >> cartState: anObject [
	cartState := anObject
]

{ #category : #accessing }
ShrineShoppingCart >> cartStatePaid [

	^ #Paid
]

{ #category : #accessing }
ShrineShoppingCart >> cartStateShopping [

	^ #Shopping
]

{ #category : #accessing }
ShrineShoppingCart >> cartValues [
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
ShrineShoppingCart >> cartVisible [
	^ cartVisible
]

{ #category : #accessing }
ShrineShoppingCart >> cartVisible: anObject [
	cartVisible := anObject
]

{ #category : #stripe }
ShrineShoppingCart >> createCheckoutSessionRequest: html json: json [
	| successUrl cancelUrl client responseJsonString responseJson |

	successUrl := html urlForAction: [ self actionSuccess ].
	cancelUrl := html urlForAction: [ self actionCancel ].
"
self mcwApplicationGet logString: successUrl printString.
self mcwApplicationGet logString: cancelUrl printString.
"

	(client := ZnClient new)
		https;
		host: 'api.stripe.com';
		addPath: (Array with: 'v1' with: 'checkout' with: 'sessions');
		username: self mcwApplicationGet stripeSecretKey password: '';
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
		ifFalse: [ self mcwApplicationGet logString: 'Stripe error response: ', responseJsonString ].

	^ json string: responseJsonString
]

{ #category : #initialization }
ShrineShoppingCart >> initialize [

	super initialize.

	self cartVisible: false.
	self cartItemsClear.
]

{ #category : #utility }
ShrineShoppingCart >> printAsMoney: aValue [

	^ '$', (aValue printShowingDecimalPlaces: 2)
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartHeaderOn: html [

	html div: [
		self renderDismissButtonOn: html.
		html space; space.
		self renderCartSummaryOn: html ]
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartItemImagesOn: html [

	self cartItems do: [ :eachItem |			
		html image "mdcImageList__image;"
			style: 'width: 48px; height: 48px';
			url: (eachItem at: 'images') first ]
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartItemsOn: html [

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
ShrineShoppingCart >> renderCartLine: lineItemName total: lineItemValue on: html [

	html span mdcTypography_body1; with: lineItemName.
	html text: ' . . . '.
	html span mdcTypography_body1; with: lineItemValue.
	html break
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartOn: html [

	self renderCartHeaderOn: html.
	
	self cartState = self cartStateShopping
		ifTrue: [ ^ self renderCartShoppingOn: html ].
		
	self cartState = self cartStatePaid
		ifTrue: [ ^ self renderCartPaidOn: html ].
		
	html text: 'Cart error'
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartPaidOn: html [

	self renderCartTotalsOn: html.
	html span mdcTypography_headline6; with: 'Payment successful !'.
	self renderClearCartButtonOn: html
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartShoppingOn: html [

	self renderCartItemsOn: html.
	self renderCartTotalsOn: html.
	self renderCheckoutButtonOn: html.
	self renderClearCartButtonOn: html
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartSummaryOn: html [

	html span mdcTypography_subtitle1; with: [
		html text: 'CART'; space; space; space.
		html text: self cartItems size printString.
		html text: (self cartItems size = 1 ifTrue: [ ' ITEM' ] ifFalse: [ ' ITEMS' ]) ].
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartTotalsOn: html [
	| cartValues |

	cartValues := self cartValues.

	self renderCartLine: 'TOTAL' total: (self printAsMoney: (cartValues at: #total)) on: html.
	self renderCartLine: 'Subtotal' total: (self printAsMoney: (cartValues at: #subtotal)) on: html.
	self renderCartLine: 'Shipping' total: (self printAsMoney: (cartValues at: #shipping)) on: html.
	self renderCartLine: 'Tax' total: (self printAsMoney: (cartValues at: #tax)) on: html.
]

{ #category : #rendering }
ShrineShoppingCart >> renderCheckoutButtonOn: html [

	html button
		mdcButton;
		mdcButton_raised;
		style: 'width: 100%';
		onClick: (self stripeRedirectScriptOn: html);
		with: 'Proceed to checkout'
]

{ #category : #rendering }
ShrineShoppingCart >> renderClearCartButtonOn: html [

	html anchor
		mdcButton;
		mdcButton_raised;
		style: 'width: 100%';
		callback: [ self cartItemsClear ];
		with: 'Clear cart'
]

{ #category : #rendering }
ShrineShoppingCart >> renderContentOn: html [

	html div
		style: 'padding: 8px';
		style: 'background: var(--mdc-theme-secondary)';
		with: [
			self cartVisible
				ifTrue: [ self renderCartOn: html ]
				ifFalse: [ self renderShowCartButtonOn: html ] ]

	
]

{ #category : #rendering }
ShrineShoppingCart >> renderDismissButtonOn: html [

	html anchor mdcMaterialIcons; mdcIconButton; "mdcButton_raised;"
		callback: [ self cartVisible: false ];
		with: [ html div mdcButton__ripple; with:'expand_less' ]
]

{ #category : #rendering }
ShrineShoppingCart >> renderShowCartButtonOn: html [

	html anchor mdcMaterialIcons; mdcIconButton; "mdcButton_unelevated;" "mdcButton_raised;"
		callback: [ self cartVisible: true ];
		with: [ html div mdcButton__ripple; with: 'shopping_cart' ].

	self renderCartItemImagesOn: html
]

{ #category : #stripe }
ShrineShoppingCart >> serverUrl [

	^ self mcwPublicServerUrl
		ifNotNil: [ :value | value ]
		ifNil: [ self error: 'Public server URL not set' ]
]

{ #category : #stripe }
ShrineShoppingCart >> stripeRedirectScriptOn: html [

	^ html jQuery getJson 
		json: [ :json | self createCheckoutSessionRequest: html json: json ];
		onSuccess: (html javascript << (JSStream new
				nextPutAll: 'Stripe(''';
				nextPutAll: self mcwApplicationGet stripePublishableKey;
				nextPutAll: ''').redirectToCheckout({sessionId: JSON.parse(arguments[0]).id})';
				yourself);
			yourself)
]
