rendering - drawer
renderExtraTallAnchorButtonOn: html

	html render: (MCWAnchorTextButton new
		buttonLabel: 'Toggle Extra-Tall';
		callback: [self extraTallShown: self extraTallShown not];
		yourself).
