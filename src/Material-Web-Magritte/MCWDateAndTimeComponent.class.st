Class {
	#name : #MCWDateAndTimeComponent,
	#superclass : #MCWTextInputComponent,
	#category : #'Material-Web-Magritte'
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

	^ "self isChrome" true ifTrue: [ #iso8601WithoutTZ ] ifFalse: [ #datetimeHtml5 ]
]

{ #category : #rendering }
MCWDateAndTimeComponent >> inputType [

	^ 'datetime-local'
]

{ #category : #accessing }
MCWDateAndTimeComponent >> iso8601 [

	^ self value
		ifNil: [ DateAndTime now printString ]
		ifNotNil: [:t | t isString ifTrue: [(DateAndTime fromString: t) printString] ifFalse: [t printString] ]
]

{ #category : #accessing }
MCWDateAndTimeComponent >> iso8601: aString [

	aString isEmpty ifFalse: [
		self value: (DateAndTime fromString: aString) ]
]

{ #category : #accessing }
MCWDateAndTimeComponent >> iso8601WithoutTZ [
	| isoString |

	isoString := self value
		ifNil: [ DateAndTime now printString ]
		ifNotNil: [ :t | t isString ifTrue: [ (DateAndTime fromString: t) printString] ifFalse: [t printString] ].

	^ isoString copyFrom: 1 to: 19
]

{ #category : #accessing }
MCWDateAndTimeComponent >> iso8601WithoutTZ: aString [

	aString isEmpty ifFalse: [
		self value: (DateAndTime fromString: aString) ]
]
