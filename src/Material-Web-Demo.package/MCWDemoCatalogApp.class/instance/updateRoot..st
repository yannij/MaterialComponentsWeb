updating
updateRoot: anHtmlRoot

	super updateRoot: anHtmlRoot.

	self updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #appCss).
	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #buttonCatalogCss).

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.
