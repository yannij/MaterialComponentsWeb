actions
adjustLayoutStructure

	self sideNav bePersistentDrawer.

	self sideSheet ifNotNil: [:value |
		value
			beTemporaryDrawer;
			beDirectionToRightToLeft].

	self adjustToolbars.
