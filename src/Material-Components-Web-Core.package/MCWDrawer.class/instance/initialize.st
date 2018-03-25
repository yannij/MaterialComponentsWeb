initialization
initialize

	super initialize.

	self bePersistentDrawer.
	self list: OrderedCollection new.
	self toolbar: MCWToolbar new.
