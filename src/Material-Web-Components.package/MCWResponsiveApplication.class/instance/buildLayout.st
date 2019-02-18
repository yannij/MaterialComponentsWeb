initialization
buildLayout

	^MCWLayout new
		contentArea: MCWContentArea new;
		sideNav: self buildSideNav;
		sideSheet: self buildSideSheet;
		mainFab: self buildMainFab;
		topAppBar: self buildTopAppBar;
		yourself