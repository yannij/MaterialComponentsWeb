updating
updateRoot: anHtmlRoot

	super updateRoot: anHtmlRoot.

	self updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #commonCss).

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.
