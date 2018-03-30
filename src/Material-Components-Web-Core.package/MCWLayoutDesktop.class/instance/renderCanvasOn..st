rendering
renderCanvasOn: html

	(html tag: 'main')
		style: 'background-color: #FAFAFA';
		style: 'overflow-x: auto';
		"style: 'position: relative';"
		with: [
			"html div with: [
				html span style: 'height: 30vh; opacity: .99'; with: [ html text: 'red' ]]."
			html render: self secondaryToolbar.
			html render: self canvas.
			html render: self mainFab.
		]