initialization
initialize

	super initialize.

	self bePersistentDrawer.
	self isPersisted: false.
	self drawerTitle: ''.
	self drawerSubtitle: ''.
	self list: OrderedCollection new.

