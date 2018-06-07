actions
adjustLayoutStructure

	self sideNav beTemporaryDrawer.

	self sideSheet ifNotNil: [:value |
		value
			beTemporaryDrawer;
			beDirectionToRightToLeft].

	self adjustToolbars.
