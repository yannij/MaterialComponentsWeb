rendering - drawer
renderExtraTallAnchorButtonOn: html

	html render: (MCWAnchorTextButton new
		actionLabel: 'Toggle Extra-Tall';
		callback: [self extraTallShown: self extraTallShown not];
		yourself).
