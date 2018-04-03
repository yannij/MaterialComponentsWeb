initialization
buildMenuIconPersistent

	^(MCWToolbarMenuIcon materialIcon: 'menu') ariaLabel: 'Menu'; callback: [self sideNav isPersistedToggle]; yourself
