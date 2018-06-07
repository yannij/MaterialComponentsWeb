initialization
initialize

	super initialize.

	self colorTheme: OrderedIdentityDictionary new.

	self toolbarActions: IdentityDictionary new.
	self toolbarActionsInitialize.
	
	self layoutComponent: (MCWLayoutDesktop on: self).
	self canvas: WAComponent new.
	self sideNav: self buildSideNav.
	self rightNav: self buildRightNav.
	self mainFab: self buildMainFab.
	self topAppBar: self buildAppBar.

	self beLayoutStructureDesktop.

	"Subclasses may invoke #applicationPostInitialize: if necessary"
	"self applicationPostInitialize: self"
