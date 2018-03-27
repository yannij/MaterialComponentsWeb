initialization
initialize

	super initialize.

	self canvas: WAComponent new.

	self layoutStructure: #tablet.
	self rebuildHeader.

	self footer: self buildFooter.
	self footer toolbar
		title: 'Bottom bar';
		mcwStyle: 'background-color: #2988D1';
		yourself.

	self sideNav: self buildSideNav.
	self sideNav toolbar
		mcwStyle: 'background-color: #CD4067';
		title: 'Toolbar';
		yourself.

	self rightNav: self buildRightNav.
	self rightNav toolbar
		mcwStyle: 'background-color: #CD4067';
		title: 'Toolbar';
		yourself.

	self mainFab: self buildMainFab.
	self secondaryToolbar: (MCWToolbar new title: 'Secondary toolbar'; mcwStyle: 'background-color: #D5D5D5'; yourself).

	self beLayoutStructureTablet.
