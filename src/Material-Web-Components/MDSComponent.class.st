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

{ #category : #logging }
MDSComponent >> logFormat: aFormatString with: aValue [

	self logString: (aFormatString format: (Array with: aValue))
]

{ #category : #logging }
MDSComponent >> logFormat: aFormatString with: aValue1 with: aValue2 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2))
]

{ #category : #logging }
MDSComponent >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3))
]

{ #category : #logging }
MDSComponent >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 with: aValue4 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3 with: aValue4))
]

{ #category : #logging }
MDSComponent >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 with: aValue4 with: aValue5 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3 with: aValue4 with: aValue5))
]

{ #category : #logging }
MDSComponent >> logString: aString [

	Transcript crShow: aString
]

{ #category : #actions }
MDSComponent >> toggleHiddenValue [

	self hidden: self hidden not
]
