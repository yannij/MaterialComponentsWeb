rendering
renderContentOn: html

	html document addLoadScript: (JSScript new add: (JSStream new nextPutAll: 'mdc.autoInit()')).

	self renderRootOn: html.

	self renderMaterialComponentsWebJsOn: html.
