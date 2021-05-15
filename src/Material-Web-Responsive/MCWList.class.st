Class {
	#name : #MCWList,
	#superclass : #MCWLayoutComponent,
	#instVars : [
		'selectedIndex',
		'listItems',
		'subheader'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MCWList >> closeScript [

	^ 'element = document.getElementById(''', self id, '''); element.MDCMenu.open = false'
]

{ #category : #initialization }
MCWList >> initialize [

	super initialize.

	self selectedIndex: 0.
	self listItems: OrderedCollection new.

	"Check for nil, when rendering"
	"self subheading: nil."

]

{ #category : #accessing }
MCWList >> listItemAdd: aListItem [

	self listItems add: aListItem.
	aListItem list: self

]

{ #category : #accessing }
MCWList >> listItemAddAll: aCollection [

	aCollection do: [ :eachItem | self listItemAdd: eachItem ]
]

{ #category : #accessing }
MCWList >> listItems [
	^ listItems
]

{ #category : #accessing }
MCWList >> listItems: anObject [
	listItems := anObject
]

{ #category : #rendering }
MCWList >> listTagOn: html [

	self subclassResponsibility
]

{ #category : #rendering }
MCWList >> openScript [

	^ 'element = document.getElementById(''', self id, '''); element.MDCMenu.open = !element.MDCMenu.open'
]

{ #category : #rendering }
MCWList >> renderContentOn: html [

	(self listTagOn: html) with: [
		self subheader notNil
			ifTrue: [ html heading level3; mdcListGroup__subheader; with: self subheader ].
		self listItems keysAndValuesDo: [ :index :each |
			each selected: (index = self selectedIndex).
			html render: each ] ]
]

{ #category : #accessing }
MCWList >> selectedIndex [
	^ selectedIndex
]

{ #category : #accessing }
MCWList >> selectedIndex: anObject [
	selectedIndex := anObject
]

{ #category : #accessing }
MCWList >> subheader [
	^ subheader
]

{ #category : #accessing }
MCWList >> subheader: anObject [
	subheader := anObject
]
