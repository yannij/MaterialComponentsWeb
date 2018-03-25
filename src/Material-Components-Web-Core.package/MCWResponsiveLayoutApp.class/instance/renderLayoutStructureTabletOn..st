rendering - layouts
renderLayoutStructureTabletOn: html

	html render: self sideNav.
	html render: self rightNav.

	html div
		style: 'display: inline-flex; flex-direction: column; flex-grow: 1; height: 100%; box-sizing: border-box;';
		with: [
			html render: self header.
			self renderCurrentCanvasOn: html.
			html render: self footer.
		].
