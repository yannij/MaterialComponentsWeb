accessing-magritte
backgroundDescription
	<magritteDescription>

	^MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #background));
		default: (Color fromHexString: 'ffffff');
		label: 'Background';
		priority: 140;
		yourself