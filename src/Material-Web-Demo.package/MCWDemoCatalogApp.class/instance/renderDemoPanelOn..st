rendering - catalog page
renderDemoPanelOn: html

	html div class: 'demo-panel'; with: [
		self renderDrawerOn: html.
		self renderDemoContentOn: html]