Class {
	#name : #MCWUserInterfaceRegion,
	#superclass : #MCWLayoutComponent,
	#instVars : [
		'containingLayout',
		'displayType'
	],
	#category : #'Material-Web-Responsive'
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
MCWUserInterfaceRegion >> containingLayout [
	^ containingLayout
]

{ #category : #accessing }
MCWUserInterfaceRegion >> containingLayout: anObject [
	containingLayout := anObject
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
