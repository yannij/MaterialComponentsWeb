initialization
buildSideNavMenuList

	^MCWListBasic new
		addListItem: (MCWListItemIcon  itemText: 'Side Nav 1' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'Side Nav 2' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'Side Nav 3' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'Side Nav 4' iconName: 'star' callback: []);
		yourself.
