initialization
buildPopupMenuSettings

	^(MCWListMenuItems id: self popupMenuSettingsId)
		addListItem: (MCWListItemIcon new iconName: 'cancel'; itemText: 'Cancel'; callback: []; yourself);
		addListItem: (MCWListItemIcon new iconName: 'smartphone'; itemText: 'Phone'; callback: [self beLayoutStructureMobile]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'tablet'; itemText: 'Tablet'; callback: [self beLayoutStructureTablet]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'computer'; itemText: 'Desktop'; callback: [self beLayoutStructureDesktop]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'more_horiz'; itemText: 'Side Sheet'; onClickScript: self openRidghtNavScript; yourself);
		addListItem: (MCWListItemIcon new iconName: 'star'; itemText: 'Custom'; callback: [self colorThemeExample]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'star'; itemText: 'Custom Clear'; callback: [self colorThemeExampleClear]; yourself);
		yourself
