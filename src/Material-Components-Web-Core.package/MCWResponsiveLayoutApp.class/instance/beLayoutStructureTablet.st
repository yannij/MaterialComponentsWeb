actions
beLayoutStructureTablet

	self layoutStructure: #tablet.

	self secondaryToolbar beHidden.

	self sideNav toolbarHide; bePersistentDrawer.

	self rightNav
		toolbarHide;
		beTemporaryDrawer;
		beDirectionToRightToLeft.

	self footer toolbar beUnHidden.

	self rebuildHeader.
