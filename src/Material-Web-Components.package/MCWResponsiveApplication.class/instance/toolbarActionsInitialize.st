initialization
toolbarActionsInitialize
	"Subclasses may enhance"

	self toolbarActions
		at: #sideSheet put: ((MCWToolbarMenuIcon materialIcon: 'more_horiz') ariaLabel: 'Right Nav'; onClickScript: self openRidghtNavScript; yourself);
		at: #layoutPhone put: ((MCWToolbarMenuIcon materialIcon: 'smartphone') ariaLabel: 'Phone View'; callback: [self beLayoutStructureMobile]; yourself);
		at: #layoutTablet put: ((MCWToolbarMenuIcon materialIcon: 'tablet') ariaLabel: 'Tablet View'; callback: [self beLayoutStructureTablet]; yourself);
		at: #layoutDesktop put: ((MCWToolbarMenuIcon materialIcon: 'computer') ariaLabel: 'Desktop View'; callback: [self beLayoutStructureDesktop]; yourself);
		at: #toys put: ((MCWToolbarMenuIcon materialIcon: 'toys') ariaLabel: 'More'; onClickScript: self popupMenuLayoutScript; yourself);
		at: #toysPopup put: (self buildPopupMenuLayout);
		at: #settings put: ((MCWToolbarMenuIcon materialIcon: 'settings') ariaLabel: 'Custom'; onClickScript: self popupMenuSettingsScript; yourself);
		at: #settingsPopup put: (self buildPopupMenuSettings);
		at: #bookmark put: ((MCWToolbarMenuIcon  materialIcon: 'bookmark') ariaLabel: 'Bookmark this page'; yourself);
		yourself
