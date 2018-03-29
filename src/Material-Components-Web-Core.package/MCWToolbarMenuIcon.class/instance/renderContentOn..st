rendering
renderContentOn: html

	self imagePath notNil
		ifTrue: [^self renderImageOn: html].

	self renderAnchorOn: html.
