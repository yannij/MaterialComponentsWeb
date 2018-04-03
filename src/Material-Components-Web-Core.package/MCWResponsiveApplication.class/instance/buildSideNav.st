initialization
buildSideNav

	^MCWDrawer new
		id: self sideNavDrawerId;
		list: self buildSideNavMenuList;
		menuIconPersistent: self buildMenuIconPersistent;
		menuIconTemporary: self buildMenuIconTemporary;
		isPersisted: true;
		yourself.
