actions
beLayoutStructureTablet

	self layoutStructure: #tablet.

	self secondaryToolbar ifNotNil: [:value | value beHidden].

	self sideNav toolbarHide; bePersistentDrawer.

	self rightNav ifNotNil: [:value |
		value
			toolbarHide;
			beTemporaryDrawer;
			beDirectionToRightToLeft].

	self footer toolbar beUnHidden.

	self rebuildHeader.
