Class {
	#name : #MDSTopAppBarAction,
	#superclass : #MDSComponent,
	#instVars : [
		'onClickScript',
		'iconName',
		'callback'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #'instance creation' }
MDSTopAppBarAction class >> materialIcon: anIconName [

	^ self materialIcon: anIconName callback: nil
]

{ #category : #'instance creation' }
MDSTopAppBarAction class >> materialIcon: anIconName callback: aBlock [

	^ self new
		iconName: anIconName;
		callback: aBlock;
		yourself
]

{ #category : #'instance creation' }
MDSTopAppBarAction class >> materialIcon: anIconName onClickScript: aScript [

	^ self new
		iconName: anIconName;
		onClickScript: aScript;
		yourself
]

{ #category : #accessing }
MDSTopAppBarAction >> callback [
	^ callback
]

{ #category : #accessing }
MDSTopAppBarAction >> callback: anObject [
	callback := anObject
]

{ #category : #testing }
MDSTopAppBarAction >> hasCallback [

	^ self callback notNil
]

{ #category : #testing }
MDSTopAppBarAction >> hasOnClickScript [

	^ self onClickScript notNil
]

{ #category : #accessing }
MDSTopAppBarAction >> iconName [
	^ iconName
]

{ #category : #accessing }
MDSTopAppBarAction >> iconName: anObject [
	iconName := anObject
]

{ #category : #accessing }
MDSTopAppBarAction >> onClickScript [
	^ onClickScript
]

{ #category : #accessing }
MDSTopAppBarAction >> onClickScript: anObject [
	onClickScript := anObject
]
