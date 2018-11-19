rendering
renderTopAppBarRowIconOn: html

	false
		ifTrue: [self renderMaterialLogoOn: html]
		ifFalse: [self renderMenuIconOn: html]