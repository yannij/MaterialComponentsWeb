initialization
registerToDeployment: aName

	^(super registerToDeployment: aName)
		addLibrary: MCWBasicLayoutLibrary;
		yourself