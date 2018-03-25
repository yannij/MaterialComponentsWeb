actions
beLayoutStructureDesktop

	self layoutStructure: #desktop.

	self secondaryToolbar beUnHidden.

	self sideNav
		toolbarUnHide;
		bePermanentBelowToolbarDrawer.

	self rightNav
		toolbarUnHide;
		bePermanentBelowToolbarDrawer;
		beDirectionLeftToRight.

	self footer toolbar beHidden.

	self rebuildHeader.
