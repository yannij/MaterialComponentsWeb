actions
beLayoutStructureMobile

	self layoutStructure: #mobile.

	self secondaryToolbar ifNotNil: [:value | value beHidden].

	self sideNav toolbarHide; beTemporaryDrawer.

	self rightNav ifNotNil: [:value |
		value
			toolbarHide;
			beTemporaryDrawer;
			beDirectionToRightToLeft].

	self footer toolbar beUnHidden.

	self rebuildHeader.
