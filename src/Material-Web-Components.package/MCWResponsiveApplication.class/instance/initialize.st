initialization
initialize

	super initialize.

	self settings: self buildApplicationSettings.
	self layout: self buildLayout.
	self beLayoutStructureDesktop.

	"Subclasses may invoke #applicationPostInitialize: if necessary"
	"self applicationPostInitialize: self"
