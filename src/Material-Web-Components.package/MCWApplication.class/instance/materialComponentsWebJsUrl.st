accessing
materialComponentsWebJsUrl

	^ self materialVersion isNil
		ifTrue: [MCWDevelopmentLibrary / #materialcomponentswebJs]
		ifFalse: [ self materialComponentsWebUrlFragment, '.min.js']
