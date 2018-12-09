testing
isDrawerOpen

	^(self isDismissibleDrawer or: [self isModalDrawer]) and: [ self isDismissed not ]