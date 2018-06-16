rendering
renderContentOn: html

	self sideNav cssClass: nil.

	html render: self appBar.
	html render: self sideNav.
	html render: self sideSheet.

	html div
		style: 'margin-top: ', self appBar marginHeight printString, 'px';
		style: 'display: inline-flex; flex-direction: column; flex-grow: 1; height: 100%; box-sizing: border-box;';
		with: [
			self renderCanvasOn: html.
		]
