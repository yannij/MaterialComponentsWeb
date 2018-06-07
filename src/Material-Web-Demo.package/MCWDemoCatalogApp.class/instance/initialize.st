initialization
initialize

	super initialize.

	self canvas: MCWDemoCatalogCanvas new.

	self applicationPostInitialize: self
