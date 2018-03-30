actions
adjustLayoutStructure

	self sideNav toolbarHide; beTemporaryDrawer.

	self rightNav ifNotNil: [:value |
		value
			toolbarHide;
			beTemporaryDrawer;
			beDirectionToRightToLeft].

	self adjustToolbars.
