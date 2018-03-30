rendering
renderContentOn: html

	html div script: (JSScript new add: (JSStream new nextPutAll: 'window.mdc.autoInit()')).

	html render: self layoutComponent.

	self renderMaterialComponentsWebJsOn: html.
