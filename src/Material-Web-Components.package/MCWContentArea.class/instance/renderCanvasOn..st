rendering
renderCanvasOn: html

	self component isNil
		ifTrue: [^self].

	html div mdcLayoutGrid;
		style: '--mdc-layout-grid-margin-desktop: 16px';
		style: '--mdc-layout-grid-gutter-desktop: 16px';
		with: [
			html div mdcLayoutGrid__inner; with: [
				html div mdcLayoutGrid__cell_span: self component layoutCellSpan; with: [
					html render: self component]]]
