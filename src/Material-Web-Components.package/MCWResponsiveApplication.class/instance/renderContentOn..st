rendering
renderContentOn: html

	html document addLoadScript: (JSScript new add: (JSStream new nextPutAll: 'window.mdc.autoInit()')).

	self renderSetColorTHemeOn: html.

	self renderSetGoogleFont: self currentFont on: html.

	(self isLoggedIn or: [self loginComponent isNil])
		ifTrue: [html render: "self layoutComponent" self layout]
		ifFalse: [html render: self loginComponent].

	self renderMaterialComponentsWebJsOn: html.
