rendering
renderContentOn: html

	self appBar isShortCollapsed
		ifTrue: [self sideNav cssClass: 'appBarPadding']
		ifFalse: [self sideNav cssClass: nil].

	html render: self appBar.

	html div
		style: 'margin-top: ', self appBar marginHeight printString, 'px';
		style: 'display: inline-flex; flex-direction: row; flex-grow: 1; height: 100%; box-sizing: border-box;';
		with: [
			html render: self sideNav.
			self renderCanvasOn: html.
			html div style: 'margin-left: auto';
					with: [html render: self sideSheet]]
