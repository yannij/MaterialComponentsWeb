initialization
setFont: aFontName
	| fontChoice |

	fontChoice := MCWGoogleFont fontNamed: aFontName.

	fontChoice notNil ifTrue: [
		self fontChoicesAdd: fontChoice.
		self font: fontChoice]
