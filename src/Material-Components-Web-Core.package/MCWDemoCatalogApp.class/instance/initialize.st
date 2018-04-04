initialization
initialize

	super initialize.

	self sideNav toolbar: nil.
	self secondaryToolbar: nil.
	self canvas: MCWMaterialComponentsCatalog new.

	self prepare: self
