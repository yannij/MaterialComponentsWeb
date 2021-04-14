Class {
	#name : #MCWListItemTwoLine,
	#superclass : #MCWListItemComponent,
	#instVars : [
		'itemSecondaryText',
		'imageName'
	],
	#category : #'Material-Web-Components'
}

{ #category : #'instance creation' }
MCWListItemTwoLine class >> itemText: aString itemSecondaryText: aSecondaryString imageName: anImageName callback: aBlock [

	^ self new
		itemText: aString;
		itemSecondaryText: aSecondaryString;
		callback: aBlock;
		imageName: anImageName;
		yourself
]

{ #category : #accessing }
MCWListItemTwoLine >> imageName [
	^ imageName
]

{ #category : #accessing }
MCWListItemTwoLine >> imageName: anObject [
	imageName := anObject
]

{ #category : #initialization }
MCWListItemTwoLine >> initialize [

	super initialize.

	self itemSecondaryText: ''.
	self imageName: ''.

]

{ #category : #accessing }
MCWListItemTwoLine >> itemSecondaryText [
	^ itemSecondaryText
]

{ #category : #accessing }
MCWListItemTwoLine >> itemSecondaryText: anObject [
	itemSecondaryText := anObject
]

{ #category : #rendering }
MCWListItemTwoLine >> renderContentOn: html [
	| tag |

	tag := html anchor.
	self selected ifTrue: [ tag mdcListItem_selected ].
	tag
		mdcListItem;
		mdcRole: 'listitem';
		callback: self callback;
		with: [
			html span mdcListItem__graphic with: [ html image url: self imageName ].
			html span mdcListItem__text with: [
				html text: self itemText.
				html span mdcListItem__secondaryText; with: self itemSecondaryText ] ]
]
