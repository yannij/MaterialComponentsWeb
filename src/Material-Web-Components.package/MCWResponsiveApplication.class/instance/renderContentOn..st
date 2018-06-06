rendering
renderContentOn: html

	html div script: (JSScript new add: (JSStream new nextPutAll: 'window.mdc.autoInit()')).

	(self isLoggedIn or: [self loginComponent isNil])
		ifTrue: [html render: self layoutComponent]
		ifFalse: [html render: self loginComponent].

	self renderMaterialComponentsWebJsOn: html.
