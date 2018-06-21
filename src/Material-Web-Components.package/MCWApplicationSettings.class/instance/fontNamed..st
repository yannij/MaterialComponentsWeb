accessing
fontNamed: aGoogleFonttKey

	^self fontChoices
		detect: [:each | each googleFontsFamily = aGoogleFonttKey ]
		ifNone: [nil]