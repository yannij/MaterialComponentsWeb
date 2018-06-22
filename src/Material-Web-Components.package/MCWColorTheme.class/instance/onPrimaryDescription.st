accessing-magritte
onPrimaryDescription
	<magritteDescription>

	^MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-primary'));
		default: (Color fromHexString: 'ffffff');
		label: 'On Primary';
		priority: 105;
		yourself