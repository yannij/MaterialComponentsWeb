initialization
buildAppBarPopupMenu

	^(MCWListMenuItems id: self appBarPopupMenuId)
		addListItem: (MCWListItemIcon new iconName: 'smartphone'; itemText: 'Phone'; callback: [self beLayoutStructureMobile]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'tablet'; itemText: 'Tablet'; callback: [self beLayoutStructureTablet]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'computer'; itemText: 'Desktop'; callback: [self beLayoutStructureDesktop]; yourself);
		"addListItem: MCWListItemSeparator new;
		addListItem: (MCWListItemPopupMenu new itemText: 'Popup 1');
		addListItem: (MCWListItemPopupMenu new itemText: 'Popup 2');
		addListItem: (MCWListItemPopupMenu new itemText: 'Popup 3');
		addListItem: (MCWListItemPopupMenu new itemText: 'Popup 4 ...');"
		yourself
