actions
togglePersistentDrawer

	self sideNav isPersistedToggle.
	self layoutComponent adjustToolbarsPersistedSideNav: self sideNav isPersisted.
