rendering
renderContentOn: html

	html div script: (JSScript new add: (JSStream new nextPutAll: 'window.mdc.autoInit()')).

	self isLayoutStructureMobile
		ifTrue: [self renderLayoutStructureMobileOn: html].

	self isLayoutStructureTablet
		ifTrue: [self renderLayoutStructureTabletOn: html].

	self isLayoutStructureDesktop
		ifTrue: [self renderLayoutStructureDesktopOn: html].

	self renderMaterialComponentsWebJsOn: html.
