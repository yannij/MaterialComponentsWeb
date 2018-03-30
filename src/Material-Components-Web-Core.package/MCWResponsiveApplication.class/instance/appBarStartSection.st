initialization
appBarStartSection

	^{
		(MCWToolbarMenuIcon materialIcon: 'menu') ariaLabel: 'Menu'; onClickScript: self openSideNavScript; yourself
	}
