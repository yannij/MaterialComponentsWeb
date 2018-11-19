initialization
buildSideNav

	^MCWDrawer new
		id: self sideNavDrawerId;
		list: self buildSideNavList;
		menuIconPersistent: self buildMenuIconPersistent;
		"menuIconTemporary: self buildMenuIconTemporary;"
		menuIconTemporary: self buildMenuIconPersistent;
		isPersisted: true;
		yourself.
