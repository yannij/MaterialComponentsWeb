initialization
initialize

	super initialize.

	self bePersistentDrawer.
	self isPersisted: false.
	self list: OrderedCollection new.
