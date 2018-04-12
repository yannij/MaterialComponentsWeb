initialization
buildPopupMenuLayout

	^(MCWListMenuItems id: self popupMenuLayoutId)
		addListItem: (MCWListItemIcon new iconName: 'smartphone'; itemText: 'Phone'; callback: [self beLayoutStructureMobile]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'tablet'; itemText: 'Tablet'; callback: [self beLayoutStructureTablet]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'computer'; itemText: 'Desktop'; callback: [self beLayoutStructureDesktop]; yourself);
		yourself
