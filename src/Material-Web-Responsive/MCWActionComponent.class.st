Class {
	#name : #MCWActionComponent,
	#superclass : #MCWWebComponent,
	#instVars : [
		'actionLabel',
		'onClickScript',
		'callback'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MCWActionComponent >> actionLabel [
	^ actionLabel
]

{ #category : #accessing }
MCWActionComponent >> actionLabel: anObject [
	actionLabel := anObject
]

{ #category : #accessing }
MCWActionComponent >> callback [
	^ callback
]

{ #category : #accessing }
MCWActionComponent >> callback: anObject [
	callback := anObject
]

{ #category : #testing }
MCWActionComponent >> hasActionLabel [

	^ self actionLabel notNil and: [ self actionLabel notEmpty ]
]

{ #category : #testing }
MCWActionComponent >> hasCallback [

	^ self callback notNil
]

{ #category : #testing }
MCWActionComponent >> hasOnClickScript [

	^ self onClickScript notNil
]

{ #category : #initialization }
MCWActionComponent >> initialize [

	super initialize.

	self actionLabel: ''.

	"Should check for nil"
	"self onClickScript: nil."
	"self callback: []."

]

{ #category : #accessing }
MCWActionComponent >> onClickScript [
	^ onClickScript
]

{ #category : #accessing }
MCWActionComponent >> onClickScript: anObject [
	onClickScript := anObject
]

{ #category : #rendering }
MCWActionComponent >> renderContentOn: html [

	self subclassResponsibility
]
