initialization
initialize

	super initialize.

	self settings: self buildApplicationSettings.

	self layoutComponent: (MCWLayoutDesktop on: self).
	self canvas: MCWCanvasComponent new.
	self sideNav: self buildSideNav.
	self sideSheet: self buildSideSheet.
	self mainFab: self buildMainFab.

	"Do thsese action late, so other initialization is already done"
	self topAppBar: self buildTopAppBar.
	self topAppBar topAppBarSpacersHide.
	self beLayoutStructureDesktop.

	"Subclasses may invoke #applicationPostInitialize: if necessary"
	"self applicationPostInitialize: self"
