actions
adjustLayoutStructure

	self sideNav bePermanentBelowToolbarDrawer.

	self sideSheet ifNotNil: [:value |
		value
			bePermanentBelowToolbarDrawer;
			beDirectionLeftToRight].

	self adjustToolbars.
