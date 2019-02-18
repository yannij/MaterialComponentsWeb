initialization
initialize

	super initialize.

	self layout contentArea component: MCWShrineCanvas new.
	self loginComponent: MCWShrineLogin new.

	self settings setFont: (MCWGoogleFont fontNamed: 'Rubik').

	"self colorThemeCustom.
	self colorThemeCustomDark.
	self colorThemeCss inspect"