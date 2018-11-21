initialization
buildSideNavList

	^MCWListGroup new
		addGroupedList: (MCWListBasic new
			"subheader: 'List 1';"
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 1' iconName: 'assignment' callback: []);
			addListItem: (MCWListItemIcon  itemText: 'ZZ Nav Item 2' iconName: 'bug_report' callback: [self sideNav menuItemCallback]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 3' iconName: 'build' callback: []);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 4' iconName: 'delete' callback: []);
			yourself);
		addGroupedList: (MCWListBasic new
			subheader: 'List 2';
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 5' iconName: 'face' callback: []);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 6' iconName: 'face' callback: []);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 7' iconName: 'face' callback: []);
			addListItem: (MCWListItemSeparator new);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 8' iconName: 'star' callback: []);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 9' iconName: 'star' callback: []);
			yourself);
		yourself
