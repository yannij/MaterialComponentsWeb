rendering
renderCanvasOn: html

	(html tag: 'main')
		style: 'background-color: #FAFAFA';
		style: 'overflow-x: auto';
		"style: 'position: relative';"
		class: 'mdc-toolbar-fixed-adjust' if: self isLayoutStructureDesktop not;
		with: [
			html render: self secondaryToolbar.
			html render: self canvas.
			html render: self mainFab.
		]