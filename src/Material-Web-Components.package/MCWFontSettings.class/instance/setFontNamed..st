initialization
setFontNamed: aFontName
	| fontChoice |

	fontChoice := MCWGoogleFont fontNamed: aFontName.

	fontChoice notNil ifTrue: [
		self setFont: fontChoice]
