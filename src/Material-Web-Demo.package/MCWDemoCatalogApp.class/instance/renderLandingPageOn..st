rendering - landing page
renderLandingPageOn: html

	html div
		class: 'mdc-top-app-bar--fixed-adjust';
		with: [ self renderCatalogListOn: html ]