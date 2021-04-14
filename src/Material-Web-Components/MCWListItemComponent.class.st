Class {
	#name : #MCWListItemComponent,
	#superclass : #MCWActionComponent,
	#instVars : [
		'list',
		'itemText',
		'selected'
	],
	#category : #'Material-Web-Components'
}

{ #category : #'instance creation' }
MCWListItemComponent class >> itemText: aString [

	^ self new
		itemText: aString;
		yourself
]

{ #category : #'instance creation' }
MCWListItemComponent class >> itemText: aString callback: aBlock [

	^ (self itemText: aString)
		callback: aBlock;
		yourself
]

{ #category : #initialization }
MCWListItemComponent >> initialize [

	super initialize.

	self itemText: ''.
	self selected: false.

]

{ #category : #accessing }
MCWListItemComponent >> isSelected [

	^ self selected
]

{ #category : #accessing }
MCWListItemComponent >> itemText [
	^ itemText
]

{ #category : #accessing }
MCWListItemComponent >> itemText: anObject [
	itemText := anObject
]

{ #category : #accessing }
MCWListItemComponent >> list [
	^ list
]

{ #category : #accessing }
MCWListItemComponent >> list: anObject [
	list := anObject
]

{ #category : #rendering }
MCWListItemComponent >> renderContentOn: html [

	self subclassResponsibility
]

{ #category : #accessing }
MCWListItemComponent >> selected [
	^ selected
]

{ #category : #accessing }
MCWListItemComponent >> selected: anObject [
	selected := anObject
]
