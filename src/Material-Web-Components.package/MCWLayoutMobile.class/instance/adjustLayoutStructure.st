actions
adjustLayoutStructure

	self sideNav beModalDrawer; beDismissed.

	self sideSheet ifNotNil: [:value |
		value
			beModalDrawer;
			beDirectionToRightToLeft].

	self adjustToolbars.
