initialization
registerToDevelopment: aName

	^(super registerToDevelopment: aName)
		addLibrary: MCWBasicLayoutLibrary;
		yourself