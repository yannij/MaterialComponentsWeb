rendering
renderContentOn: html 

	self view isNil
		ifTrue: [^html div id: 'setup'; class: 'setup'; with: 'hello world'].

	html div mdcLayoutGrid;
		style: '--mdc-layout-grid-margin-desktop: 16px';
		style: '--mdc-layout-grid-gutter-desktop: 16px';
		with: [
		html div mdcLayoutGrid__inner; with: [
			html div mdcLayoutGrid__cell_span: self view layoutCellSpan; with: [
				html render: self view]]]
