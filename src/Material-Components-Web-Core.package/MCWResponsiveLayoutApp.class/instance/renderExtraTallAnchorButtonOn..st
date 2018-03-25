rendering - tall and wide
renderExtraTallAnchorButtonOn: html

	html render: (MCWAnchorButton new
		buttonLabel: 'Toggle Extra-Tall';
		callback: [self extraTallShown: self extraTallShown not];
		yourself).
