initialization
toolbarActionsInitialize
	"Subclasses may enhance"

	self toolbarActions
		at: #sideSheet put: ((MCWAppBarMenuIcon materialIcon: 'more_horiz') ariaLabel: 'Right Nav'; onClickScript: self openRidghtNavScript; yourself);
		at: #layoutPhone put: ((MCWAppBarMenuIcon materialIcon: 'smartphone') ariaLabel: 'Phone View'; callback: [self beLayoutStructureMobile]; yourself);
		at: #layoutTablet put: ((MCWAppBarMenuIcon materialIcon: 'tablet') ariaLabel: 'Tablet View'; callback: [self beLayoutStructureTablet]; yourself);
		at: #layoutDesktop put: ((MCWAppBarMenuIcon materialIcon: 'computer') ariaLabel: 'Desktop View'; callback: [self beLayoutStructureDesktop]; yourself);
		at: #toys put: ((MCWAppBarMenuIcon materialIcon: 'toys') ariaLabel: 'More'; onClickScript: self popupMenuLayoutScript; yourself);
		at: #toysPopup put: (self buildPopupMenuLayout);
		at: #settings put: ((MCWAppBarMenuIcon materialIcon: 'settings') ariaLabel: 'Custom'; onClickScript: self popupMenuSettingsScript; yourself);
		at: #settingsPopup put: (self buildPopupMenuSettings);
		at: #bookmark put: ((MCWAppBarMenuIcon  materialIcon: 'bookmark') ariaLabel: 'Bookmark this page'; yourself);
		yourself
