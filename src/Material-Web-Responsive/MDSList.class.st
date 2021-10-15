Class {
	#name : #MDSList,
	#superclass : #MDSComponent,
	#instVars : [
		'items',
		'subheader'
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

{ #category : #accessing }
MDSList >> itemsAddAll: aCollection [

	aCollection do: [ :eachItem | self itemsAdd: eachItem ]
]

{ #category : #rendering }
MDSList >> renderContentOn: html [

	self renderListOn: html
]

{ #category : #rendering }
MDSList >> renderListOn: html [

	self subheader notNil ifTrue: [
		html heading level3; mdcDeprecatedListGroup__subheader; with: self subheader ].

	html navigation
		mdcDeprecatedList;
		mdcList_dense_if: self mcwDenseView;
		mdcRole: 'list';
		with: [
			self items do: [ :eachItem | html render: eachItem ] ]
]

{ #category : #accessing }
MDSList >> subheader [

	^ subheader
]

{ #category : #accessing }
MDSList >> subheader: anObject [

	subheader := anObject
]
