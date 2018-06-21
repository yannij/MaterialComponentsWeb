accessing-magritte
primaryDescription
	<magritteDescription>

	^MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #primary));
		default: (Color fromHexString: '6200ee');
		label: 'Primary';
		priority: 100;
		yourself