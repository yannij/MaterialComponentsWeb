rendering - grid
renderDemoLayoutGridOn: html


	html section class: 'hero'; with: [
		html div class: 'demo-grid mdc-layout-grid'; with: [
			html div class: 'mdc-layout-grid__inner'; with: [
				html div class: 'demo-cell mdc-layout-grid__cell mdc-layout-grid__cell--span-4'.
				html div class: 'demo-cell mdc-layout-grid__cell mdc-layout-grid__cell--span-4'.
				html div class: 'demo-cell mdc-layout-grid__cell mdc-layout-grid__cell--span-4'.
				]]].

	self renderGridDifferentSizesOn: html.
	self renderGridDifferentSizesTweaksOn: html.
