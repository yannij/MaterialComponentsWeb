rendering
renderContentOn: html

	html render: self sideNav.
	html render: self sideSheet.
	html render: self mainFab.

	html div
		style: 'display: inline-flex; flex-direction: column; flex-grow: 1; height: 100%; box-sizing: border-box;';
		with: [
			html render: self appBar.
			self renderCanvasOn: html.
		].
