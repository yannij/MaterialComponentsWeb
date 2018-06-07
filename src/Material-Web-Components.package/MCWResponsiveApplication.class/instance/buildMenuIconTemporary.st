initialization
buildMenuIconTemporary

	^(MCWAppBarMenuIcon materialIcon: 'menu') ariaLabel: 'Menu'; onClickScript: self openSideNavScript; yourself
