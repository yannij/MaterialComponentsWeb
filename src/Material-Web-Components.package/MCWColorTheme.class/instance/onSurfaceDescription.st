accessing-magritte
onSurfaceDescription
	<magritteDescription>

	^MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-surface'));
		default: (Color fromHexString: 'ff6090');
		label: 'On Surface';
		priority: 135;
		yourself