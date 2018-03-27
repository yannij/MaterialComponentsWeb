initialization
buildSideNavMenuList

	^MCWList new
		addListItem: (MCWListItemIcon  itemText: 'Drawer' iconName: 'star' callback: [self canvas showDrawer]);
		addListItem: (MCWListItemIcon  itemText: 'Layout Grid' iconName: 'star' callback: [self canvas showLayoutGrid]);
		addListItem: (MCWListItemIcon  itemText: 'Typography' iconName: 'star' callback: [self canvas showTypography]);
		addListItem: (MCWListItemIcon  itemText: 'todo 1' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'todo 2' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'todo 3' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'todo 4' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'todo 5' iconName: 'star' callback: []);
		yourself.
