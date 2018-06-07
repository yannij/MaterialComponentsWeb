initialization
buildSideNav

	^MCWDrawer new
		id: self sideNavDrawerId;
		list: self buildSideNavList;
		menuIconPersistent: self buildMenuIconPersistent;
		menuIconTemporary: self buildMenuIconTemporary;
		isPersisted: true;
		yourself.
