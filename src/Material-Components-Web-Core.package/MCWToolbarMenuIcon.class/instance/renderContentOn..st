rendering
renderContentOn: html

	self imagePath notNil
		ifTrue: [self renderImageOn: html]
		ifFalse: [self renderAnchorOn: html].

