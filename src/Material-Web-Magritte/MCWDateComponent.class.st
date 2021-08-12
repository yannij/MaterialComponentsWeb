Class {
	#name : #MCWDateComponent,
	#superclass : #MCWTextInputComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MCWDateComponent >> dateHtml5 [

	^ self value
		ifNil: [ Date today yyyymmdd ]
		ifNotNil: [ :t | t isString ifTrue: [ t asDate ] ifFalse: [ t asDate yyyymmdd ] ]

]

{ #category : #accessing }
MCWDateComponent >> dateHtml5: aString [

	aString isEmpty ifFalse: [
		self value: (Date fromString: aString) ]
]

{ #category : #rendering }
MCWDateComponent >> inputAspect [

	^ #dateHtml5
]

{ #category : #rendering }
MCWDateComponent >> inputType [

	^ 'date'
]
