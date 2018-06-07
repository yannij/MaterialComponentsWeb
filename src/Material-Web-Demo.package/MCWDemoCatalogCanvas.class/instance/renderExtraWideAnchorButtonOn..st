rendering - drawer
renderExtraWideAnchorButtonOn: html

	html render: (MCWAnchorTextButton new
		buttonLabel: 'Toggle Extra-Wide';
		callback: [self extraWideShown: self extraWideShown not];
		yourself).
