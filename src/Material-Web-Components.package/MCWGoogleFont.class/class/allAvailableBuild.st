accessing
allAvailableBuild

	^self allAvailableData collect: [:data | MCWGoogleFont from: data]
