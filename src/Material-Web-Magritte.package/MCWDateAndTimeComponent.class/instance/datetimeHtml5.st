accessing
datetimeHtml5

	^ self value
		ifNil: [ DateAndTime now printHtml5 ]
		ifNotNil: [:t | t isString ifTrue: [(DateAndTime fromString: t) printHtml5] ifFalse: [t printHtml5] ]