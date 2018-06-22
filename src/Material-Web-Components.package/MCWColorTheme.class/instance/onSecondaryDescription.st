accessing-magritte
onSecondaryDescription
	<magritteDescription>

	^MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-secondary'));
		default: (Color fromHexString: 'ffffff');
		label: 'On Secondary';
		priority: 115;
		yourself