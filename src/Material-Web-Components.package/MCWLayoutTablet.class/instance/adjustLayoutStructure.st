actions
adjustLayoutStructure

	self sideNav beDismissibleDrawer; beDismissed.

	self sideSheet ifNotNil: [:value |
		value
			beModalDrawer;
			beDirectionToRightToLeft].

	self adjustToolbars.
