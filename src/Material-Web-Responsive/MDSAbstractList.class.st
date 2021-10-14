Class {
	#name : #MDSAbstractList,
	#superclass : #MDSComponent,
	#instVars : [
		'selectedIndex',
		'listItems',
		'subheader'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MDSAbstractList >> closeScript [

	^ 'element = document.getElementById(''', self id, '''); element.MDCMenu.open = false'
]

{ #category : #initialization }
MDSAbstractList >> initialize [

	super initialize.

	self selectedIndex: 0.
	self listItems: OrderedCollection new.

	"Check for nil, when rendering"
	"self subheading: nil."

]

{ #category : #accessing }
MDSAbstractList >> listItemAdd: aListItem [

	self listItems add: aListItem.
	aListItem list: self

]

{ #category : #accessing }
MDSAbstractList >> listItemAddAll: aCollection [

	aCollection do: [ :eachItem | self listItemAdd: eachItem ]
]

{ #category : #accessing }
MDSAbstractList >> listItems [
	^ listItems
]

{ #category : #accessing }
MDSAbstractList >> listItems: anObject [
	listItems := anObject
]

{ #category : #rendering }
MDSAbstractList >> listTagOn: html [

	self subclassResponsibility
]

{ #category : #rendering }
MDSAbstractList >> openScript [

	^ 'element = document.getElementById(''', self id, '''); element.MDCMenu.open = !element.MDCMenu.open'
]

{ #category : #rendering }
MDSAbstractList >> renderContentOn: html [

	(self listTagOn: html) with: [
		self subheader notNil
			ifTrue: [ html heading level3; mdcDeprecatedListGroup__subheader; with: self subheader ].
		self listItems keysAndValuesDo: [ :index :each |
			each selected: (index = self selectedIndex).
			html render: each ] ]
]

{ #category : #accessing }
MDSAbstractList >> selectedIndex [
	^ selectedIndex
]

{ #category : #accessing }
MDSAbstractList >> selectedIndex: anObject [
	selectedIndex := anObject
]

{ #category : #accessing }
MDSAbstractList >> subheader [
	^ subheader
]

{ #category : #accessing }
MDSAbstractList >> subheader: anObject [
	subheader := anObject
]
