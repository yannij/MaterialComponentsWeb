Class {
	#name : #MCWDateAndTimeComponent,
	#superclass : #MCWTextInputComponent,
	#category : 'Material-Web-Magritte'
}

{ #category : #accessing }
MCWDateAndTimeComponent >> datetimeHtml5 [

	^ self value
		ifNil: [ DateAndTime now printHtml5 ]
		ifNotNil: [:t | t isString ifTrue: [(DateAndTime fromString: t) printHtml5] ifFalse: [t printHtml5] ]
]

{ #category : #accessing }
MCWDateAndTimeComponent >> datetimeHtml5: aString [

	aString isEmpty ifFalse: [
		self value: (DateAndTime fromString: aString) ]
]

{ #category : #rendering }
MCWDateAndTimeComponent >> inputAspect [

	^ #datetimeHtml5
]

{ #category : #rendering }
MCWDateAndTimeComponent >> inputType [

	^ 'datetime-local'
]
