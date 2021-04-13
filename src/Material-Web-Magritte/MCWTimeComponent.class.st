Class {
	#name : #MCWTimeComponent,
	#superclass : #MCWTextInputComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWTimeComponent >> inputAspect [

	^ true "self isChrome" ifTrue: [ #time24 ] ifFalse: [ #timeHtml5 ]
]

{ #category : #rendering }
MCWTimeComponent >> inputType [

	^ 'time'
]

{ #category : #accessing }
MCWTimeComponent >> time24 [

	^ self value
		ifNil: [ Time now print24 ]
		ifNotNil: [ :t | t print24 ]
]

{ #category : #accessing }
MCWTimeComponent >> time24: aString [

	aString isEmpty ifFalse: [
		self value: (Time fromString: aString) ]
]

{ #category : #accessing }
MCWTimeComponent >> timeHtml5 [

	^ self value
		ifNil: [ Time now printHtml5 ]
		ifNotNil: [ :t | t printHtml5 ]
]

{ #category : #accessing }
MCWTimeComponent >> timeHtml5: aString [

	aString isEmpty ifFalse: [
		self value: (Time fromString: aString) ]
]
