rendering - landing page
renderLandingPageOn: html

	html div
		mdcTopAppBar_fixedAdjust;
		with: [ self renderCatalogListOn: html ]