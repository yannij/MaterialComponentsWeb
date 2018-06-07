rendering
renderCanvasOn: html

	(html tag: 'main')
		class: 'mcw-layout-tablet';
		style: 'background-color: #FAFAFA';
		style: 'overflow-x: auto';
		style: 'padding-bottom: 40px';
		with: [
			html render: self canvas.
		]
