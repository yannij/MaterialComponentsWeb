accessing
datetimeHtml5

	^ self value
		ifNil: [ DateAndTime now printHtml5 ]
		ifNotNil: [:t | t isString ifTrue: [ t ] ifFalse: [t printHtml5] ]