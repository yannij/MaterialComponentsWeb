accessing
materialComponentsWebJsUrl

	^false
		ifTrue: [MCWDevelopmentLibrary / #materialcomponentswebJs]
		"ifFalse: [(WAUrl absolute: 'https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js')]"
		ifFalse: ['https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js']
