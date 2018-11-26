page - button
renderButtonDemoOn: html

	html heading level2; class: 'demo-title'; mdcTypography_headline6; with: 'Demos'.

	html div with: [
		self renderButtonDemoContentOn: html]