rendering - drawer
renderExtraWideOn: html

	html div
		id: self extraWideId;
		mdcElevation_z4;
		style: 'background-color: lightGray';
		style: 'margin: 8px';
		style: 'padding: 8px';
		style: 'width: 200vw';
		style: (self extraWideShown ifTrue: [nil] ifFalse: ['display: none']);
		with: 'Extra Wide'.
