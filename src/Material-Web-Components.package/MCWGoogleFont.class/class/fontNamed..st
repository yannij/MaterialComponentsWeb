accessing
fontNamed: aGoogleFonttKey

	^self allAvailable
		detect: [:each | each googleFontsFamily = aGoogleFonttKey ]
		ifNone: [nil]