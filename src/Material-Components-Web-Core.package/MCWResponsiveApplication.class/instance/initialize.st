initialization
initialize

	super initialize.

	self toolbarActions: IdentityDictionary new.
	self toolbarActionsInitialize.
	
	self layoutComponent: (MCWLayoutDesktop on: self).

	self canvas: WAComponent new.

	self sideNav: self buildSideNav.
	self sideNav toolbar
		mcwStyle: 'background-color: #CD4067';
		toolbarTitle: 'Side Toolbar';
		yourself.

	self rightNav: self buildRightNav.
	self rightNav notNil
		ifTrue: [
			self rightNav toolbar
				mcwStyle: 'background-color: #CD4067';
				toolbarTitle: 'Right Toolbar';
				yourself].

	self mainFab: self buildMainFab.
	self secondaryToolbar: (MCWToolbar new toolbarTitle: 'Secondary toolbar'; mcwStyle: 'background-color: #D5D5D5'; yourself).

	self appBar: self buildAppBar.
	self header: self buildHeader.

	self footer: self buildFooter.
	self footer toolbar
		title: 'Bottom bar';
		mcwStyle: 'background-color: #2988D1';
		yourself.

	self beLayoutStructureTablet.
