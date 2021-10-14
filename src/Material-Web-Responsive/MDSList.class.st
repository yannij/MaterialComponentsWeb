Class {
	#name : #MDSList,
	#superclass : #MDSComponent,
	#instVars : [
		'items'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSList >> do: aBlock [

	self items do: aBlock
]

{ #category : #initialization }
MDSList >> initialize [

	super initialize.

	self items: OrderedCollection new
]

{ #category : #accessing }
MDSList >> items [

	^ items
]

{ #category : #accessing }
MDSList >> items: anObject [

	items := anObject
]

{ #category : #accessing }
MDSList >> itemsAdd: aTab [

	self items add: aTab
]

{ #category : #rendering }
MDSList >> renderContentOn: html [

	self renderListOn: html
]

{ #category : #rendering }
MDSList >> renderListOn: html [

	html div mdcDeprecatedList; "mdcAutoInit: 'MDCList';" with: [
		self items do: [ :eachItem | html render: eachItem ] ]
]
