initialization
toolbarActionsInitialize

	self toolbarActions
		"at: #layoutPhone put: ((MCWAppBarMenuIcon materialIcon: 'smartphone') ariaLabel: 'Phone View'; callback: [self beLayoutStructureMobile]; yourself);
		at: #layoutTablet put: ((MCWAppBarMenuIcon materialIcon: 'tablet') ariaLabel: 'Tablet View'; callback: [self beLayoutStructureTablet]; yourself);
		at: #layoutDesktop put: ((MCWAppBarMenuIcon materialIcon: 'computer') ariaLabel: 'Desktop View'; callback: [self beLayoutStructureDesktop]; yourself);"
		at: #settings put: ((MCWAppBarMenuIcon materialIcon: 'settings') ariaLabel: 'Custom'; onClickScript: self popupMenuSettingsScript; yourself);
		at: #settingsPopup put: (self buildPopupMenuSettings);
		yourself
