accessing
dateHtml5

	^ self value
		ifNil: [ Date today yyyymmdd ]
		ifNotNil: [:t | t isString ifTrue: [ t ] ifFalse: [t yyyymmdd] ]
