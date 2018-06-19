rendering
renderContentOn: html

	html div script: (JSScript new add: (JSStream new nextPutAll: 'window.mdc.autoInit()')).

	html script with: 'document.querySelector("body").style.setProperty("--mdc-theme-primary", "orange")'.

	self renderSetGoogleFont: (self googleFontNamed: 'Fontdiner+Swanky') on: html.

	(self isLoggedIn or: [self loginComponent isNil])
		ifTrue: [html render: self layoutComponent]
		ifFalse: [html render: self loginComponent].

	self renderMaterialComponentsWebJsOn: html.
