Class {
	#name : #ShrineShoppingCart,
	#superclass : #MCWWebComponent,
	#instVars : [
		'cartState',
		'cartItems',
		'topSheet'
	],
	#category : #'Material-Study-Shrine'
}

{ #category : #'instance creation' }
ShrineShoppingCart class >> on: aTopSheet [

	^ self new
		topSheet: aTopSheet;
		yourself
]

{ #category : #stripe }
ShrineShoppingCart >> actionCancel [

	self mcwApplicationGet logString: 'Cancel'
]

{ #category : #stripe }
ShrineShoppingCart >> actionSuccess [

	self mcwApplicationGet logString: 'Success'.

	self cartState: self cartStatePaid
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
ShrineShoppingCart >> cartItemsClear [

	self cartState: self cartStateShopping.

	"self cartItems: OrderedCollection new."
	self cartItems: (OrderedCollection with: Object new)
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
	shipping := 10.00.
	tax := subtotal * 0.1.
	
	^ IdentityDictionary new
		at: #total put: (subtotal + shipping + tax);
		at: #subtotal put: subtotal;
		at: #shipping put: shipping;
		at: #tax put: tax;
		yourself
]

{ #category : #stripe }
ShrineShoppingCart >> createCheckoutSessionRequest: html json: json [
	| serverUrlString successUrl cancelUrl client stripeResponse |

	serverUrlString := self serverUrl printString.
	serverUrlString last = $/ ifTrue: [
		serverUrlString := serverUrlString copyWithoutIndex: serverUrlString size ].
	successUrl := html urlForAction: [ self actionSuccess ].
	cancelUrl := html urlForAction: [ self actionCancel ].

"self mcwApplicationGet logString: serverUrlString.
self mcwApplicationGet logString: successUrl printString.
self mcwApplicationGet logString: cancelUrl printString."

	(client := ZnClient new)
		https;
		host: 'api.stripe.com';
		addPath: (Array with: 'v1' with: 'checkout' with: 'sessions');
		username: self stripeSecretKey password: self stripeSecretKey;
		formAt: 'success_url' put: serverUrlString, successUrl printString;
		formAt: 'cancel_url' put: serverUrlString, cancelUrl printString;
		formAt: 'payment_method_types[0]' put: 'card';
		formAt: 'line_items[0][price]' put: 'price_0IlPNK6QgJXWI9aTI0CX40eD';
		formAt: 'line_items[0][quantity]' put: '2';
		formAt: 'mode' put: 'payment';
		yourself.

	stripeResponse := client post.

	^ json string: stripeResponse
]

{ #category : #initialization }
ShrineShoppingCart >> initialize [

	super initialize.

	self cartItemsClear.
]

{ #category : #utility }
ShrineShoppingCart >> printAsMoney: aValue [

	^ '$', (aValue printShowingDecimalPlaces: 2)
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

	self cartState = self cartStateShopping
		ifTrue: [ ^ self renderCartShoppingOn: html ].
	self cartState = self cartStatePaid
		ifTrue: [ ^ self renderCartPaidOn: html ].
	html text: 'Cart error'
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartPaidOn: html [

	self renderCartSummaryOn: html.
	self renderCartTotalsOn: html.
	html span mdcTypography_headline6; with: 'Payment successful !'.
	self renderClearCartButtonOn: html
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartShoppingOn: html [

	self renderCartSummaryOn: html.
	self renderCartTotalsOn: html.
	self renderCheckoutButtonOn: html.
	self renderClearCartButtonOn: html
]

{ #category : #rendering }
ShrineShoppingCart >> renderCartSummaryOn: html [

	html heading level6; mdcTypography_subtitle1; style: 'margin: 4px auto';
		with: 'CART ', self cartItems size printString, ' ITEMS'.
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
		onClick: (self stripeRedirectScriptOn: html);
		with: 'Proceed to checkout'
]

{ #category : #rendering }
ShrineShoppingCart >> renderClearCartButtonOn: html [

	html anchor
		mdcButton;
		mdcButton_raised;
		callback: [ self cartItemsClear ];
		with: 'Clear cart'
]

{ #category : #rendering }
ShrineShoppingCart >> renderContentOn: html [

	html div style: 'margin: 16px 0px'; with: [
		self renderDismissButtonOn: html.
		self renderCartOn: html ]
]

{ #category : #rendering }
ShrineShoppingCart >> renderDismissButtonOn: html [

	html anchor
		mdcIconButton;
		mdcButton_raised;
		callback: [ self topSheet shoppingCartVisible: false ];
		with: [
			html span mdcMaterialIcons; with: 'expand_less' ]
]

{ #category : #stripe }
ShrineShoppingCart >> serverUrl [
	| basicUrl serverUrl |

	serverUrl := WAUrl new.
	basicUrl := self session basicUrl.
	basicUrl host
		ifNotNil: [ :value |
			serverUrl scheme: basicUrl scheme.
			serverUrl host: basicUrl host.
			serverUrl port: basicUrl port ]
		ifNil: [
			| serverUrlZinc |
			serverUrlZinc := self serverUrlZinc.
			serverUrl scheme: serverUrlZinc scheme.
			serverUrl host: serverUrlZinc host.
			serverUrl port: serverUrlZinc port ].

	^ serverUrl
]

{ #category : #stripe }
ShrineShoppingCart >> serverUrlZinc [
	| adaptors server |

	adaptors := WAServerManager default adaptors.
	adaptors size = 1 ifFalse: [ self error: 'Seaside server configuration problem' ].
	
	server := adaptors any server.
	^ server serverUrl
		ifNotNil: [ :value | value ]
		ifNil: [ server localUrl ]
]

{ #category : #stripe }
ShrineShoppingCart >> stripePublishableKey [
	"
	OSEnvironment current at: 'STRIPE_PUBLISHABLE_KEY' put: 'pk_your_key'
	"

	^ OSEnvironment current at: 'STRIPE_PUBLISHABLE_KEY' ifAbsent: [ 'PUBLISHABLE_KEY_NOT_SET' ]
]

{ #category : #stripe }
ShrineShoppingCart >> stripeRedirectScriptOn: html [

	^ html jQuery getJson 
		json: [ :json | self createCheckoutSessionRequest: html json: json ];
		onSuccess: (html javascript << (JSStream new
				nextPutAll: 'Stripe(''';
				nextPutAll: self stripePublishableKey;
				nextPutAll: ''').redirectToCheckout({sessionId: JSON.parse(arguments[0]).id})';
				yourself);
			yourself)
]

{ #category : #stripe }
ShrineShoppingCart >> stripeSecretKey [
	"
	OSEnvironment current at: 'STRIPE_SECRET_KEY' put: 'sk_your_key'
	"

	^ OSEnvironment current at: 'STRIPE_SECRET_KEY' ifAbsent: [ 'SECRET_KEY_NOT_SET' ]
]

{ #category : #accessing }
ShrineShoppingCart >> topSheet [
	^ topSheet
]

{ #category : #accessing }
ShrineShoppingCart >> topSheet: anObject [
	topSheet := anObject
]
