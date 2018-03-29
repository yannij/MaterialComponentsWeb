actions
beLayoutStructureDesktop

	self layoutStructure: #desktop.

	self secondaryToolbar ifNotNil: [:value | value beUnHidden].

	self sideNav
		toolbarUnHide;
		bePermanentBelowToolbarDrawer.

	self rightNav ifNotNil: [:value |
		value
			toolbarUnHide;
			bePermanentBelowToolbarDrawer;
			beDirectionLeftToRight].

	self footer toolbar beHidden.

	self rebuildHeader.
