actions
isDismissedToggle

	self isDismissed: self isDismissed not.
	(self isDismissed and: [self isDismissibleDrawer])
		ifTrue: [self session presenter layout topAppBar topAppBarSpacersHide]
		ifFalse: [self session presenter layout topAppBar topAppBarSpacersShow].
	(self isModalDrawer or: self isPersistentDrawer)
		ifTrue: [self session presenter layout topAppBar topAppBarSpacersHide]