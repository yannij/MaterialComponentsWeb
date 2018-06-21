accessing-magritte
secondaryDescription
	<magritteDescription>

	^MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #secondary));
		default: (Color fromHexString: '018786');
		label: 'Secondary';
		priority: 110;
		yourself