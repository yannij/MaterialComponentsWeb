rendering
renderContentOn: html

	self renderDrawerOn: html.

	html div
		class: 'demo-content';
		with: [
			self renderToolbarOn: html..
			self renderMainOn: html.
			self renderScriptOn: html.
		].
