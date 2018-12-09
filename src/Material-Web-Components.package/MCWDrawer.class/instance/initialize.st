initialization
initialize

	super initialize.

	self beDismissibleDrawer.
	self isDismissed: true.
	self drawerTitle: ''.
	self drawerSubtitle: ''.
	self list: OrderedCollection new.

