initialization
buildSideNavMenuList

	^MCWListBasic new
		addListItem: (MCWListItemIcon itemText: 'Featured' iconName: '' callback: []);
		"Divider Line"
		addListItem: (MCWListItemIcon itemText: 'Apartment' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Accessories' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Shoes' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Tops' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Bottoms' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Dresses' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'My Account' iconName: '' callback: []);
		yourself.
