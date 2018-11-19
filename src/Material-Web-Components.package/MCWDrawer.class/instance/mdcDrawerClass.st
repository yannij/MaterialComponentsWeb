accessing
mdcDrawerClass

	self isTemporaryDrawer ifTrue: [^'mdc-drawer--modal'].
	self isPersistentDrawer ifTrue: [^'mdc-drawer--dismissible'].

