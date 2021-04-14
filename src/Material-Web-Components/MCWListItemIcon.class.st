Class {
	#name : #MCWListItemIcon,
	#superclass : #MCWListItemComponent,
	#instVars : [
		'iconName'
	],
	#category : #'Material-Web-Components'
}

{ #category : #'instance creation' }
MCWListItemIcon class >> itemText: aString callback: aBlock iconName: aMaterialIconName [

	^ (self itemText: aString callback: aBlock)
		iconName: aMaterialIconName;
		yourself
]

{ #category : #'instance creation' }
MCWListItemIcon class >> itemText: aString iconName: aMaterialIconName callback: aBlock [

	^ self itemText: aString callback: aBlock iconName: aMaterialIconName
]

{ #category : #accessing }
MCWListItemIcon >> iconName [
	^ iconName
]

{ #category : #accessing }
MCWListItemIcon >> iconName: anObject [
	iconName := anObject
]

{ #category : #initialization }
MCWListItemIcon >> initialize [

	super initialize.

	self iconName: ''.
]

{ #category : #rendering }
MCWListItemIcon >> renderContentOn: html [
	| tag |

	tag := html anchor.
	self selected ifTrue: [ tag mdcListItem_selected ].

	tag onClickScript: self onClickScript if: self hasOnClickScript.
	(self list notNil and: [ self list id notNil ])
		ifTrue: [ tag onClickScript: self list closeScript if: true ].

	tag
		callback: self callback if: self hasCallback;
		mdcListItem; with: [
			(self iconName notNil and: [ self iconName notEmpty ]) ifTrue: [
				html span
					mdcMaterialIcons; mdcListItem__graphic;
					attributeAt: 'aria-hidden' put: 'true';
					with: [ html text: self iconName ] ].
			html text: self itemText ]

]
