rendering - tall and wide
renderExtraWideAnchorButtonOn: html

	html render: (MCWAnchorButton new
		buttonLabel: 'Toggle Extra-Wide';
		callback: [self extraWideShown: self extraWideShown not];
		yourself).
