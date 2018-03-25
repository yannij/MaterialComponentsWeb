accessing
mdcDrawerClass

	self isTemporaryDrawer ifTrue: [^'mdc-drawer--temporary'].
	self isPersistentDrawer ifTrue: [^'mdc-drawer--persistent'].
	self isPermanentAboveToolbarDrawer ifTrue: [^'mdc-drawer--permanent'].
	self isPermanentBelowToolbarDrawer ifTrue: [^'mdc-drawer--permanent'].
