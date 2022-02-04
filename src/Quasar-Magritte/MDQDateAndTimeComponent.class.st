Class {
	#name : #MDQDateAndTimeComponent,
	#superclass : #MDQTextInputComponent,
	#category : #'Quasar-Magritte'
}

{ #category : #accessing }
MDQDateAndTimeComponent >> datetimeHtml5 [

	^ self value
		ifNil: [ DateAndTime now printHtml5 ]
		ifNotNil: [ :t | t isString ifTrue: [ (DateAndTime fromString: t) printHtml5 ] ifFalse: [ t printHtml5 ] ]
]

{ #category : #accessing }
MDQDateAndTimeComponent >> datetimeHtml5: aString [

	aString isEmpty ifFalse: [
		self value: (DateAndTime fromString: aString) ]
]

{ #category : #rendering }
MDQDateAndTimeComponent >> inputAspect [

	^ true "self isChrome" ifTrue: [ #iso8601WithoutTZ ] ifFalse: [ #datetimeHtml5 ]
]

{ #category : #rendering }
MDQDateAndTimeComponent >> inputType [

	^ 'datetime-local'
]

{ #category : #accessing }
MDQDateAndTimeComponent >> iso8601 [

	^ self value
		ifNil: [ DateAndTime now printString ]
		ifNotNil: [ :t | t isString ifTrue: [ (DateAndTime fromString: t) printString ] ifFalse: [ t printString ] ]
]

{ #category : #accessing }
MDQDateAndTimeComponent >> iso8601: aString [

	aString isEmpty ifFalse: [
		self value: (DateAndTime fromString: aString) ]
]

{ #category : #accessing }
MDQDateAndTimeComponent >> iso8601WithoutTZ [
	| isoString |

	isoString := self value
		ifNil: [ DateAndTime now printString ]
		ifNotNil: [ :t | t isString ifTrue: [ (DateAndTime fromString: t) printString ] ifFalse: [ t printString ] ].

	^ isoString copyFrom: 1 to: 19
]

{ #category : #accessing }
MDQDateAndTimeComponent >> iso8601WithoutTZ: aString [

	aString isEmpty ifFalse: [
		self value: (DateAndTime fromString: aString) ]
]
