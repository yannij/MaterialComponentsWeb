accessing-magritte
surfaceDescription
	<magritteDescription>

	^MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #surface));
		default: (Color fromHexString: 'ffffff');
		label: 'Surface';
		priority: 130;
		yourself