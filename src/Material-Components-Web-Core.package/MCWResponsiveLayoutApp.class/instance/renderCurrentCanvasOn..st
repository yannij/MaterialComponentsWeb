rendering
renderCurrentCanvasOn: html

	(html tag: 'main')
		style: 'background-color: #FAFAFA';
		style: 'overflow-x: auto';
		"style: 'position: relative';"
		class: 'mdc-toolbar-fixed-adjust' if: self isLayoutStructureDesktop not;
		with: [
			"html div with: [
				html span style: 'height: 30vh; opacity: .99'; with: [ html text: 'red' ]].
			self renderLayoutSwitchOn: html."
			html render: self secondaryToolbar.
			self renderLayoutSwitchOn: html.
			self renderSampleTallWideOn: html.
			self renderGridDifferentSizesOn: html.
			self renderGridDifferentSizesTweaksOn: html.
			html render: self mainFab.
		]