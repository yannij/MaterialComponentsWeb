initialization
buildMenuIconPersistent

	^(MCWAppBarMenuIcon materialIcon: 'menu') ariaLabel: 'Menu'; callback: [self toggleDismissibleDrawer]; yourself
