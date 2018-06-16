initialization
initialize

	super initialize.

	self colorTheme: OrderedIdentityDictionary new.

	self layoutComponent: (MCWLayoutDesktop on: self).
	self canvas: WAComponent new.
	self sideNav: self buildSideNav.
	self sideSheet: self buildSideSheet.
	self mainFab: self buildMainFab.

	"Do thsese action late, so other initialization is already done"
	self topAppBar: self buildTopAppBar.
	self beLayoutStructureDesktop.

	"Subclasses may invoke #applicationPostInitialize: if necessary"
	"self applicationPostInitialize: self"
