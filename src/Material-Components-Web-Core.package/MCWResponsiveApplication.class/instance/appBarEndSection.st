initialization
appBarEndSection
	| data |

	data := OrderedCollection new.

	data
		add: ((MCWToolbarMenuIcon materialIcon: 'more_horiz') ariaLabel: 'Right Nav'; onClickScript: self openRidghtNavScript; yourself);
		add: ((MCWToolbarMenuIcon materialIcon: 'smartphone') ariaLabel: 'Phone View'; callback: [self beLayoutStructureMobile]; yourself);
		add: ((MCWToolbarMenuIcon materialIcon: 'tablet') ariaLabel: 'Tablet View'; callback: [self beLayoutStructureTablet]; yourself);
		add: ((MCWToolbarMenuIcon materialIcon: 'computer') ariaLabel: 'Desktop View'; callback: [self beLayoutStructureDesktop]; yourself);
		add: ((MCWToolbarMenuIcon materialIcon: 'toys') ariaLabel: 'More'; onClickScript: self openAppBarItemMoreScript; yourself);
		add: self buildAppBarPopupMenu;
		"add: {'Download'. 'file_download'. nil};
		add: {'Print this page'. 'print'. nil};"
		yourself.

	"These buttons are here because persistent side nav causes toolbar to be pushed right"
	5 timesRepeat: [data add: ((MCWToolbarMenuIcon  materialIcon: 'bookmark') ariaLabel: 'Bookmark this page'; yourself)].

	^data
