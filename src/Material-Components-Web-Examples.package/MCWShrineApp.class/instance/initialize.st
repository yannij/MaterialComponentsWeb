initialization
initialize

	super initialize.

	self sideNav toolbar: nil.
	self secondaryToolbar: nil.
	self canvas: MCWShrineCanvas new.

	"self colorThemeCustom.
	self colorThemeCustomDark.
	self colorThemeCss inspect"