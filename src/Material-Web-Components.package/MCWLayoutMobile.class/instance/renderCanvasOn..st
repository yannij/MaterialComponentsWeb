rendering
renderCanvasOn: html

	(html tag: 'main')
		mdcToolbarFixedAdjust;
		style: 'background-color: #FAFAFA';
		style: 'overflow-x: auto';
		style: 'padding-bottom: 40px';
		with: [
			html render: self canvas.
			html render: self mainFab.
		]