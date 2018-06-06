rendering
renderCanvasOn: html

	(html tag: 'main')
		style: 'background-color: #FAFAFA';
		style: 'overflow-x: auto';
		"No padding for desktop, because no bottom bar"
		"style: 'padding-bottom: 40px';"
		"style: 'position: relative';"
		with: [
			"html div with: [
				html span style: 'height: 30vh; opacity: .99'; with: [ html text: 'red' ]]."
			html render: self secondaryToolbar.
			html render: self canvas.
			html render: self mainFab.
		]