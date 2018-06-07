rendering
renderContentOn: html

	self isHidden ifTrue: [^self].

	self imagePath notNil
		ifTrue: [self renderImageOn: html]
		ifFalse: [self renderAnchorOn: html].

