initialization
buildRightNavMenuList
	| list1 list2 |

	list1 := MCWListBasic new
		subheader: 'List 1';
		addListItem: (MCWListItemIcon  itemText: 'Right Nav 1' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'Right Nav 2' iconName: 'star' callback: []);
		addListItem: (MCWListItemSeparator new);
		addListItem: (MCWListItemIcon  itemText: 'Right Nav 3' iconName: 'star' callback: []);
		yourself.

	list2 := MCWListBasic new
		subheader: 'List 2';
		addListItem: (MCWListItemIcon  itemText: 'Right Nav 4' iconName: 'star' callback: []);
		addListItem: (MCWListItemIcon  itemText: 'Right Nav 5' iconName: 'star' callback: []);
		addListItem: (MCWListItemSeparator new);
		yourself.

	^MCWListGroup new
		addGroupedList: list1;
		addGroupedList: list2;
		yourself
