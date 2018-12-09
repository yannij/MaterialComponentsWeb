accessing
jsDrawerType

	self isModalDrawer ifTrue: [^'mdc.drawer.MDCTemporaryDrawer'].
	self isPersistentDrawer ifTrue: [^'mdc.drawer.MDCPersistentDrawer'].
	"self isPermanentAboveToolbarDrawer ifTrue: [^'mdc.drawer.MDCPermanentDrawer'].
	self isPermanentBelowToolbarDrawer ifTrue: [^'mdc.drawer.MDCPermanentDrawer']."
	^''
