actions
beLayoutStructureMobile

	self layoutStructure: #mobile.

	self secondaryToolbar beHidden.

	self sideNav toolbarHide; beTemporaryDrawer.

	self rightNav
		toolbarHide;
		beTemporaryDrawer;
		beDirectionToRightToLeft.

	self footer toolbar beUnHidden.

	self rebuildHeader.
