initialization
buildSideNav

	^MCWDrawer new
		id: self sideNavDrawerId;
		drawerTitle: self drawerTitle;
		drawerSubtitle: self drawerSubtitle;
		list: self buildSideNavList;
		menuIconPersistent: self buildMenuIconPersistent;
		"menuIconTemporary: self buildMenuIconTemporary;"
		menuIconTemporary: self buildMenuIconPersistent;
		isPersisted: true;
		yourself.
