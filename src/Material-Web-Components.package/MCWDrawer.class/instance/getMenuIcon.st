actions
getMenuIcon

	self isPersistentDrawer
		ifTrue: [^self menuIconPersistent].

	self isTemporaryDrawer
		ifTrue: [^self menuIconTemporary].

	^self menuIconPersistent
