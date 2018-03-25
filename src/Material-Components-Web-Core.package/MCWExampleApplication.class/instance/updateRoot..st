updating
updateRoot: anHtmlRoot

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: 'https://material-components-web.appspot.com/assets/drawer/drawer.css'.
	anHtmlRoot stylesheet url: 'https://material-components-web.appspot.com/assets/radio.css'.
	self updateRootReadyJs: anHtmlRoot.
	self updateRootFonts: anHtmlRoot.

	anHtmlRoot meta attributeAt: 'viewport' put: 'width=device-width, initial-scale=1'.

	anHtmlRoot bodyAttributes addClass: 'mdc-typography demo-body'.
