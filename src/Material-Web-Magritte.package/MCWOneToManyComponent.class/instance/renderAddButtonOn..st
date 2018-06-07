rendering
renderAddButtonOn: html

	html render: (MCWButton new
		actionLabel: 'Add';
		onClickScript: ((html jQuery ajax)
			callback: [self add];
			onComplete: html javascript refresh);
		yourself).
