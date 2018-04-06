initialization
buildMenuIconPersistent

	^(MCWToolbarMenuIcon materialIcon: 'menu') ariaLabel: 'Menu'; callback: [self togglePersistentDrawer]; yourself
