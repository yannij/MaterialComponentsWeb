updating
updateRoot: anHtmlRoot

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #commonCss).
	anHtmlRoot stylesheet url: self canvas demoStylesheetUrl