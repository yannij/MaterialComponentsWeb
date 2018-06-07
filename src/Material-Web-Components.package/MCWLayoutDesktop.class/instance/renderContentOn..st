rendering
renderContentOn: html

	html div
		style: 'display: inline-flex; flex-direction: row; flex-grow: 1; box-sizing: border-box;';
		with: [
			html render: self appBar].

	html div
		mdcToolbarFixedAdjust;
		style: 'width: 100%';
		style: 'display: inline-flex; flex-direction: row; flex-grow: 1; height: 100%; box-sizing: border-box;';
		with: [
			html render: self sideNav.
			self renderCanvasOn: html.
		].
			html div style: 'float: right; margin-top: 64px'; with: [html render: self sideSheet].
