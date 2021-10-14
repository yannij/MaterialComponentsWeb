Class {
	#name : #MDSComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cssClass',
		'id',
		'hidden'
	],
	#category : #'Material-Web-Components'
}

{ #category : #'instance creation' }
MDSComponent class >> id: anIdString [

	^ self new
		id: anIdString;
		yourself
]

{ #category : #actions }
MDSComponent >> beHidden [

	self hidden: true
]

{ #category : #actions }
MDSComponent >> beUnHidden [

	self hidden: false
]

{ #category : #accessing }
MDSComponent >> cssClass [

	^ cssClass
]

{ #category : #accessing }
MDSComponent >> cssClass: anObject [

	cssClass := anObject
]

{ #category : #accessing }
MDSComponent >> hidden [
	^ hidden
]

{ #category : #accessing }
MDSComponent >> hidden: anObject [
	hidden := anObject
]

{ #category : #accessing }
MDSComponent >> id [
	^ id
]

{ #category : #accessing }
MDSComponent >> id: anObject [
	id := anObject
]

{ #category : #initialization }
MDSComponent >> initialize [

	super initialize.

	self hidden: false
]

{ #category : #testing }
MDSComponent >> isHidden [

	^ self hidden
]

{ #category : #actions }
MDSComponent >> toggleHiddenValue [

	self hidden: self hidden not
]
