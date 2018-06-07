initialization
buildSideSheetList

	^MCWListGroup new
		addGroupedList: (MCWListBasic new
			subheader: 'Categories';
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: []);
			addListItem: (MCWListItemSeparatorInset new);
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: []);
			addListItem: (MCWListItemSeparatorInset new);
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: []);
			addListItem: (MCWListItemSeparatorInset new);
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: []);
			yourself);
		addGroupedList: (MCWListBasic new
			subheader: 'Category';
			addListItem: (MCWListItemSlider itemText: 'Category' callback: []);
			yourself);
		addGroupedList: (MCWListBasic new
			subheader: 'Category';
			addListItem: (MCWListItemSlider itemText: 'Category' callback: []);
			yourself);
		yourself
