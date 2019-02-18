initialization
buildPopupMenuSettings
	| list |

	list := (MCWListMenuItems id: 'settingsPopup')
		addListItem: (MCWListItemIcon new iconName: 'cancel'; itemText: 'Cancel'; yourself);
		addListItem: (MCWListItemIcon new iconName: 'smartphone'; itemText: 'Phone'; callback: [self beLayoutStructureMobile]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'tablet'; itemText: 'Tablet'; callback: [self beLayoutStructureTablet]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'computer'; itemText: 'Desktop'; callback: [self beLayoutStructureDesktop]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'color_lens'; itemText: 'Colors'; callback: [self chooseColors]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'minimize'; itemText: 'Collapse App Bar'; callback: [self toggleAppBarCollapse]; yourself);
		yourself.

	"self layout sideSheet notNil
		ifTrue: [
			list addListItem:
				(MCWListItemIcon new iconName: 'more_horiz'; itemText: 'Side Sheet'; onClickScript: self openRidghtNavScript; yourself)]."

	^list