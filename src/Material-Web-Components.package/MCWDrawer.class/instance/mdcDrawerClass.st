accessing
mdcDrawerClass

	self isTemporaryDrawer ifTrue: [^'mdc-drawer--temporary'].
	self isPersistentDrawer ifTrue: [^'mdc-drawer--persistent'].

