rendering
renderContentOn: html

	html div
		style: 'display: inline-flex; flex-direction: row; flex-grow: 1; box-sizing: border-box;';
		with: [
			html render: self header].

	html div
		class: 'mdc-toolbar-fixed-adjust';
		style: 'width: 100%';
		style: 'display: inline-flex; flex-direction: row; flex-grow: 1; height: 100%; box-sizing: border-box;';
		with: [
			html render: self sideNav.
			self renderCanvasOn: html.
			html render: self rightNav.
		].
