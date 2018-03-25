rendering - tall and wide
renderExtraWideOn: html

	html div
		id: self extraWideId;
		class: 'mdc-elevation--z4';
		style: 'background-color: lightGray';
		style: 'margin: 8px';
		style: 'padding: 8px';
		style: 'width: 200vw';
		style: (self extraWideShown ifTrue: [nil] ifFalse: ['display: none']);
		with: 'Extra Wide'.
