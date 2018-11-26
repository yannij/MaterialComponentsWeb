initialization
buildSideNavList

	^MCWListBasic new
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 1' iconName: 'assignment' callback: [self sideNav menuItemCallback]);
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 2' iconName: 'bug_report' callback: [self sideNav menuItemCallback]);
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 3' iconName: 'build' callback: [self sideNav menuItemCallback]);
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 4' iconName: 'delete' callback: [self sideNav menuItemCallback]);
		yourself.
