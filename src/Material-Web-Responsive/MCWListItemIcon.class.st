Class {
	#name : #MCWListItemIcon,
	#superclass : #MCWActionComponent,
	#instVars : [
		'list',
		'itemText',
		'selected',
		'iconName'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #'instance creation' }
MCWListItemIcon class >> itemText: aString [

	^ self new
		itemText: aString;
		yourself
]

{ #category : #'instance creation' }
MCWListItemIcon class >> itemText: aString callback: aBlock [

	^ (self itemText: aString)
		callback: aBlock;
		yourself
]

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

	self itemText: ''.
	self selected: false.
	self iconName: ''
]

{ #category : #accessing }
MCWListItemIcon >> isSelected [

	^ self selected
]

{ #category : #accessing }
MCWListItemIcon >> itemText [
	^ itemText
]

{ #category : #accessing }
MCWListItemIcon >> itemText: anObject [
	itemText := anObject
]

{ #category : #accessing }
MCWListItemIcon >> list [
	^ list
]

{ #category : #accessing }
MCWListItemIcon >> list: anObject [
	list := anObject
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
		mdcDeprecatedListItem;
		with: [
			(self iconName notNil and: [ self iconName notEmpty ]) ifTrue: [
				html span
					mdcMaterialIcons;
					style: 'font-family: Material Icons Outlined';
					mdcDeprecatedListItem__graphic;
					attributeAt: 'aria-hidden' put: 'true';
					with: [ html text: self iconName ] ].
			html "text:" span mdcTypography_subtitle2; with: self itemText ]

]

{ #category : #accessing }
MCWListItemIcon >> selected [
	^ selected
]

{ #category : #accessing }
MCWListItemIcon >> selected: anObject [
	selected := anObject
]
