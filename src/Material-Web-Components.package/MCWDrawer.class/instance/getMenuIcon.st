actions
getMenuIcon

	self isPersistentDrawer
		ifTrue: [^self menuIconPersistent].

	self isModalDrawer
		ifTrue: [^self menuIconTemporary].

	^self menuIconPersistent
