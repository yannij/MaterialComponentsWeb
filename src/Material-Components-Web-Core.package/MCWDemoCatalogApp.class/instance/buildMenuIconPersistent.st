initialization
buildMenuIconPersistent
	| imagePath |

	imagePath := 'https://material-components-web.appspot.com/images/ic_component_24px_white.svg'.

	^(MCWToolbarMenuIcon imagePath: imagePath)
		ariaLabel: 'Menu';
		callback: [self sideNav isPersistentDrawer ifTrue: [self sideNav isPersistedToggle]];
		yourself
