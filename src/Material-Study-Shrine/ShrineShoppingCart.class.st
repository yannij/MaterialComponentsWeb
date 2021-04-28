Class {
	#name : #ShrineShoppingCart,
	#superclass : #MCWWebComponent,
	#instVars : [
		'topSheet',
		'cartItems'
	],
	#category : #'Material-Study-Shrine'
}

{ #category : #'instance creation' }
ShrineShoppingCart class >> on: aTopSheet [

	^ self new
		topSheet: aTopSheet;
		yourself
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

{ #category : #initialization }
ShrineShoppingCart >> initialize [

	super initialize.

	"self cartItems: OrderedCollection new"
	self cartItems: (OrderedCollection with: Object new with: Object new)
]

{ #category : #rendering }
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

	html anchor
		mdcButton;
		mdcButton_raised;
		callback: [  ];
		with: 'Proceed to checkout'
]

{ #category : #rendering }
ShrineShoppingCart >> renderContentOn: html [

	html div style: 'margin: 16px 0px'; with: [
		self renderDismissButtonOn: html.
		self renderCartSummaryOn: html.
		self renderCartTotalsOn: html.
		self renderCheckoutButtonOn: html ]
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

{ #category : #accessing }
ShrineShoppingCart >> topSheet [
	^ topSheet
]

{ #category : #accessing }
ShrineShoppingCart >> topSheet: anObject [
	topSheet := anObject
]
