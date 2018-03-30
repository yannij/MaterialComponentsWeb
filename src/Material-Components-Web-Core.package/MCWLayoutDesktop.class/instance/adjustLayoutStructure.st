actions
adjustLayoutStructure

	self sideNav
		toolbarUnHide;
		bePermanentBelowToolbarDrawer.

	self rightNav ifNotNil: [:value |
		value
			toolbarUnHide;
			bePermanentBelowToolbarDrawer;
			beDirectionLeftToRight].

	self adjustToolbars.
