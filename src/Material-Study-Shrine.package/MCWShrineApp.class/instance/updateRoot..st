updating
updateRoot: anHtmlRoot

	super updateRoot: anHtmlRoot.

	"anHtmlRoot stylesheet url: (WAUrl absolute: 'http://localhost:8081/assets/bundle.css')."
	anHtmlRoot stylesheet url: (MCWShrineLibrary urlOf: #bundleCss).
