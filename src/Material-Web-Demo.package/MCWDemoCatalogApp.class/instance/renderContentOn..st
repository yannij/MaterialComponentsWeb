rendering
renderContentOn: html

	html document addLoadScript: (JSScript new add: (JSStream new nextPutAll: 'window.mdc.autoInit()')).

	self renderRootOn: html.

	self renderMaterialComponentsWebJsOn: html.
