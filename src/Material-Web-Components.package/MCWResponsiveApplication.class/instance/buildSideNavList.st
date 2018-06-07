initialization
buildSideNavList

	^MCWListBasic new
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 1' iconName: 'assignment' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 2' iconName: 'bug_report' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 3' iconName: 'build' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 4' iconName: 'delete' callback: []);
		yourself.
