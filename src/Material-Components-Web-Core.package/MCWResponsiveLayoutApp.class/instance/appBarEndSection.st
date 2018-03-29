initialization
appBarEndSection
	| data |

	data := OrderedCollection new.

	(self rightNav notNil and: [self isLayoutStructureDesktop not])
		ifTrue: [
			data add: ((MCWToolbarMenuIcon materialIcon: 'more_horiz') ariaLabel: 'Right Nav'; onClickScript: self openRidghtNavScript; yourself)
			].

	data
		add: ((MCWToolbarMenuIcon materialIcon: 'smartphone') ariaLabel: 'Phone View'; callback: [self beLayoutStructureMobile]; yourself);
		add: ((MCWToolbarMenuIcon materialIcon: 'tablet') ariaLabel: 'Tablet View'; callback: [self beLayoutStructureTablet]; yourself);
		add: ((MCWToolbarMenuIcon materialIcon: 'computer') ariaLabel: 'Desktop View'; callback: [self beLayoutStructureDesktop]; yourself);
		add: ((MCWToolbarMenuIcon materialIcon: 'more_vert') ariaLabel: 'More'; onClickScript: self openAppBarItemMoreScript; yourself);
		"add: {'Download'. 'file_download'. nil};
		add: {'Print this page'. 'print'. nil};"
		yourself.

	"These buttons are here because persistent side nav cause toolbar to be pushed right"
	5 timesRepeat: [data add: ((MCWToolbarMenuIcon  materialIcon: 'bookmark') ariaLabel: 'Bookmark this page'; yourself)].

	^data
