rendering
renderCanvasOn: html

	(html tag: 'main')
		style: 'background-color: #FAFAFA';
		style: 'overflow-x: auto';
		"style: 'position: relative';"
		class: 'mdc-toolbar-fixed-adjust' if: self isLayoutStructureDesktop not;
		with: [
			html render: self secondaryToolbar.
			self renderLayoutSwitchOn: html.
			html render: self canvas showDrawer.
			html render: self canvas showLayoutGrid.
			html render: self canvas showTypography.
			html render: self mainFab.
		]