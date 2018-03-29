initialization
buildAppBarPopupMenu

	^(MCWListMenuItems id: self appBarPopupMenuId)
		addListItem: (MCWListItemPopupMenu new itemText: 'Popup 1');
		addListItem: (MCWListItemPopupMenu new itemText: 'Popup 2');
		addListItem: (MCWListItemPopupMenu new itemText: 'Popup 3');
		addListItem: MCWListItemSeparator new;
		addListItem: (MCWListItemPopupMenu new itemText: 'Popup 4 ...');
		yourself
