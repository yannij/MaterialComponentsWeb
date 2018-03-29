initialization
appBarStartSection

	self isLayoutStructureDesktop not
		ifTrue: [
				^{
				(MCWToolbarMenuIcon materialIcon: 'menu') ariaLabel: 'Menu'; onClickScript: self openSideNavScript; yourself
				}
			].

	^{}
