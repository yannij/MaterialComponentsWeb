initialization
buildPopupMenuSettings

	^(MCWListMenuItems id: self popupMenuSettingsId)
		addListItem: (MCWListItemIcon new iconName: 'star'; itemText: 'Cancel'; callback: []; yourself);
		addListItem: (MCWListItemIcon new iconName: 'star'; itemText: 'Custom'; callback: [self colorThemeExample]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'star'; itemText: 'Custom Clear'; callback: [self colorThemeExampleClear]; yourself);
		yourself
