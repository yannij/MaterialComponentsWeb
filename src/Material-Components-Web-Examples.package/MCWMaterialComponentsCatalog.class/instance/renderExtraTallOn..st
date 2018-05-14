rendering - drawer
renderExtraTallOn: html

	html div
		id: self extraTallId;
		mdcElevation__z4;
		"class: 'mdc-theme--secondary-bg mdc-theme--text-primary-on-secondary';"
		style: 'background-color: lightGray';
		style: 'margin: 8px';
		style: 'padding: 8px';
		style: 'height: 200vh';
		style: (self extraTallShown ifTrue: [nil] ifFalse: ['display: none']);
		with: 'Extra Tall'.