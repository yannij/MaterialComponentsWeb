page - button
renderCatalogPageButtonOn: html

	self renderButtonSummaryOn: html.
	self renderButtonHeroOn: html.
	self renderResources: self resourcesDataButton on: html.
	self renderButtonDemoOn: html