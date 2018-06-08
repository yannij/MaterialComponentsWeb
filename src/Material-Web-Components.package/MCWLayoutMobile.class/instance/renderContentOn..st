rendering
renderContentOn: html

	html render: self appBar.
	html render: self sideNav.
	html render: self sideSheet.
	html render: self mainFab.

	html div
		style: 'margin-top: 64px';
		style: 'display: inline-flex; flex-direction: column; flex-grow: 1; height: 100%; box-sizing: border-box;';
		with: [
			self renderCanvasOn: html.
		]
