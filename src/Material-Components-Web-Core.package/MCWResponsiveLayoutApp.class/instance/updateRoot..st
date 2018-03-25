updating
updateRoot: anHtmlRoot

	super updateRoot: anHtmlRoot.

	self updateRootMaterialComponentsWebCss: anHtmlRoot.
	self updateRootReadyJs: anHtmlRoot.
	self updateRootFonts: anHtmlRoot.

	anHtmlRoot title: 'Tidbit-MCW'.
	anHtmlRoot meta attributeAt: 'viewport' put: 'width=device-width, initial-scale=1'.

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.
	anHtmlRoot bodyAttributes addClass: self bodyTagClass.
