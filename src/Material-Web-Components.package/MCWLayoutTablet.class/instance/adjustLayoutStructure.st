actions
adjustLayoutStructure

	self sideNav toolbarHide; bePersistentDrawer.

	self rightNav ifNotNil: [:value |
		value
			toolbarHide;
			beTemporaryDrawer;
			beDirectionToRightToLeft].

	self adjustToolbars.
