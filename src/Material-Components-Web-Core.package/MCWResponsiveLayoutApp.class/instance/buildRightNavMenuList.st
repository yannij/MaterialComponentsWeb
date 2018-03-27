initialization
buildRightNavMenuList

	^MCWList new
		addListItem: (MCWListItemIcon  itemText: 'Right Nav 1' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'Right Nav 2' iconName: 'star' callback: []);
		yourself.
