rendering - drawer
renderExtraWideAnchorButtonOn: html

	html render: (MCWAnchorTextButton new
		actionLabel: 'Toggle Extra-Wide';
		callback: [self extraWideShown: self extraWideShown not];
		yourself).
