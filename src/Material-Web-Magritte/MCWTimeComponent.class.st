Class {
	#name : #MCWTimeComponent,
	#superclass : #MCWTextInputComponent,
	#category : 'Material-Web-Magritte'
}

{ #category : #rendering }
MCWTimeComponent >> inputAspect [

	^ #timeHtml5
]

{ #category : #rendering }
MCWTimeComponent >> inputType [

	^ 'time'
]

{ #category : #accessing }
MCWTimeComponent >> timeHtml5 [

	^ self value
		ifNil: [ Time now printHtml5 ]
		ifNotNil: [:t | t printHtml5 ]
]

{ #category : #accessing }
MCWTimeComponent >> timeHtml5: aString [

	aString isEmpty ifFalse: [
		self value: (Time fromString: aString) ]
]
