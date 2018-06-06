updating
updateRoot: anHtmlRoot

	super updateRoot: anHtmlRoot.

	"self updateRootMaterialComponentsWebCss: anHtmlRoot.
	self updateRootReadyJs: anHtmlRoot."
	self updateRootFonts: anHtmlRoot.

	anHtmlRoot title: self applicationTitle.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		attributeAt: 'content' put: 'width=device-width, initial-scale=1'.

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.
	anHtmlRoot bodyAttributes addClass: 'mcw-body'.
