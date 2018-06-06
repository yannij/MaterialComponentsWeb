rendering
renderContentOn: html

	self hasRipple
		ifTrue: [self renderWithRippleOn: html]
		ifFalse: [self renderCssOnlyOn: html]