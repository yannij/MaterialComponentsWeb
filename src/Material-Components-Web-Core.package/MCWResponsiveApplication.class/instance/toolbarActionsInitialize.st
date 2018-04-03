initialization
toolbarActionsInitialize
	"Subclasses may enhance"

	self toolbarActions
		at: #rightNav put: ((MCWToolbarMenuIcon materialIcon: 'more_horiz') ariaLabel: 'Right Nav'; onClickScript: self openRidghtNavScript; yourself);
		at: #layoutPhone put: ((MCWToolbarMenuIcon materialIcon: 'smartphone') ariaLabel: 'Phone View'; callback: [self beLayoutStructureMobile]; yourself);
		at: #layoutTablet put: ((MCWToolbarMenuIcon materialIcon: 'tablet') ariaLabel: 'Tablet View'; callback: [self beLayoutStructureTablet]; yourself);
		at: #layoutDesktop put: ((MCWToolbarMenuIcon materialIcon: 'computer') ariaLabel: 'Desktop View'; callback: [self beLayoutStructureDesktop]; yourself);
		at: #toys put: ((MCWToolbarMenuIcon materialIcon: 'toys') ariaLabel: 'More'; onClickScript: self openAppBarItemMoreScript; yourself);
		at: #toysPopup put: (self buildAppBarPopupMenu);
		at: #bookmark put: ((MCWToolbarMenuIcon  materialIcon: 'bookmark') ariaLabel: 'Bookmark this page'; yourself);
		yourself
