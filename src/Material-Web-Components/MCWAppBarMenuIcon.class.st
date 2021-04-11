Class {
	#name : #MCWAppBarMenuIcon,
	#superclass : #MCWActionComponent,
	#instVars : [
		'iconName',
		'imagePath'
	],
	#category : #'Material-Web-Components'
}

{ #category : #'instance creation' }
MCWAppBarMenuIcon class >> imagePath: anIconName [

	^self new
		imagePath: anIconName;
		yourself
]

{ #category : #'instance creation' }
MCWAppBarMenuIcon class >> materialIcon: anIconName [

	^self new
		iconName: anIconName;
		yourself
]

{ #category : #accessing }
MCWAppBarMenuIcon >> iconName [
	^ iconName
]

{ #category : #accessing }
MCWAppBarMenuIcon >> iconName: anObject [
	iconName := anObject
]

{ #category : #accessing }
MCWAppBarMenuIcon >> imagePath [
	^ imagePath
]

{ #category : #accessing }
MCWAppBarMenuIcon >> imagePath: anObject [
	imagePath := anObject
]

{ #category : #rendering }
MCWAppBarMenuIcon >> renderAnchorOn: html [

	html anchor
		mdcMaterialIcons;
		mdcTopAppBar__navigationIcon;
		mdcTopAppBar__actionItem;
		attributeAt: 'aria-label' put: self ariaLabel;
		style: 'text-decoration: none';
		callback: self callback if: self hasCallback;
		onClickScript: self onClickScript if: self hasOnClickScript;
		with: self iconName

]

{ #category : #rendering }
MCWAppBarMenuIcon >> renderContentOn: html [

	self isHidden ifTrue: [^self].

	self imagePath notNil
		ifTrue: [self renderImageOn: html]
		ifFalse: [self renderAnchorOn: html].


]

{ #category : #rendering }
MCWAppBarMenuIcon >> renderImageOn: html [
	| imageScript |

	self hasOnClickScript
		ifTrue: [imageScript := self onClickScript]
		ifFalse: [self hasCallback
			ifTrue: [imageScript := html javascript callback: [self callback value]; yourself]].

	html span
		mdcTopAppBar__actionItem;
		mdcTopAppBar__navigationIcon;
		attributeAt: 'aria-label' put: self ariaLabel;
		onClick: imageScript;
		with: [
			html image url: self imagePath].

]
