initialization
initialize

	super initialize.

	"self materialVersion100."
	self materialVersionLocalServer.
	"self materialVersion: '10.0.0'."
	self settings: self buildApplicationSettings.
	self layout: self buildLayout.
	self beLayoutStructureDesktop.

	"Subclasses may invoke #applicationPostInitialize: if necessary"
	"self applicationPostInitialize: self"
