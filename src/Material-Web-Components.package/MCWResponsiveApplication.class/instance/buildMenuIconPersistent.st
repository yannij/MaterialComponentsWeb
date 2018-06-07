initialization
buildMenuIconPersistent

	^(MCWAppBarMenuIcon materialIcon: 'menu') ariaLabel: 'Menu'; callback: [self togglePersistentDrawer]; yourself
