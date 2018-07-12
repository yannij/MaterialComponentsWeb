initialization
initialize

	super initialize.

	self canvas: MCWShrineCanvas new.
	self loginComponent: MCWShrineLogin new.

	self settings setFont: (MCWGoogleFont fontNamed: 'Rubik').

	"self colorThemeCustom.
	self colorThemeCustomDark.
	self colorThemeCss inspect"