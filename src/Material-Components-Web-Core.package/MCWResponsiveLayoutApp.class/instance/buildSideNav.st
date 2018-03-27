initialization
buildSideNav

	^MCWDrawer new
		id: self sideNavDrawerId;
		list: self buildSideNavMenuList;
		yourself.
