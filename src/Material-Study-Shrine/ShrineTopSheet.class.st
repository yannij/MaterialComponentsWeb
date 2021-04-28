Class {
	#name : #ShrineTopSheet,
	#superclass : #MCWWebComponent,
	#instVars : [
		'shoppingCart',
		'shoppingCartVisible'
	],
	#category : #'Material-Study-Shrine'
}

{ #category : #initialization }
ShrineTopSheet >> initialize [

	super initialize.

	self shoppingCart: (ShrineShoppingCart on: self).
	self shoppingCartVisible: false.
]

{ #category : #rendering }
ShrineTopSheet >> renderContentOn: html [

	self shoppingCartVisible
		ifTrue: [ html div with: [ html render: self shoppingCart ] ]
		ifFalse: [ self renderShoppingCartButtonOn: html ]
]

{ #category : #rendering }
ShrineTopSheet >> renderShoppingCartButtonOn: html [

	html anchor
		mdcIconButton;
		mdcButton_raised;
		callback: [ self shoppingCartVisible: true ];
		with: [
			html span mdcMaterialIcons; with: 'shopping_cart' ]
]

{ #category : #accessing }
ShrineTopSheet >> shoppingCart [
	^ shoppingCart
]

{ #category : #accessing }
ShrineTopSheet >> shoppingCart: anObject [
	shoppingCart := anObject
]

{ #category : #accessing }
ShrineTopSheet >> shoppingCartVisible [
	^ shoppingCartVisible
]

{ #category : #accessing }
ShrineTopSheet >> shoppingCartVisible: anObject [
	shoppingCartVisible := anObject
]
