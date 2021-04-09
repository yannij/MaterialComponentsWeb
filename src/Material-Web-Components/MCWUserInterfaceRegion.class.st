Class {
	#name : #MCWUserInterfaceRegion,
	#superclass : #MCWWebComponent,
	#instVars : [
		'displayType'
	],
	#category : #'Material-Web-Components'
}

{ #category : #accessing }
MCWUserInterfaceRegion >> beDisplayTypePermanent [

	self displayType: #permanent
]

{ #category : #accessing }
MCWUserInterfaceRegion >> beDisplayTypePesistent [

	self displayType: #persistent
]

{ #category : #accessing }
MCWUserInterfaceRegion >> beDisplayTypeTemporary [

	self displayType: #temporary
]

{ #category : #accessing }
MCWUserInterfaceRegion >> displayType [
	^ displayType
]

{ #category : #accessing }
MCWUserInterfaceRegion >> displayType: anObject [
	displayType := anObject
]

{ #category : #initialization }
MCWUserInterfaceRegion >> initialize [

	super initialize.

	self beDisplayTypePermanent
]

{ #category : #accessing }
MCWUserInterfaceRegion >> isDisplayTypePermanent [

	^ self displayType = #permanent
]

{ #category : #accessing }
MCWUserInterfaceRegion >> isDisplayTypePersistent [

	^ self displayType = #persistent
]

{ #category : #accessing }
MCWUserInterfaceRegion >> isDisplayTypeTemporary [

	^ self displayType = #temporary
]
