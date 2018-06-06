initialization
prepareSideNav: anApplication
	| list |

	list := MCWListTwoLine new.
	self demoSideNavListData do: [:eachItem |
		list addListItem: (MCWListItemTwoLine
			itemText: eachItem first
			itemSecondaryText: eachItem second
			imageName: 'https://material-components-web.appspot.com/images/', eachItem third
			callback: [self perform: eachItem fourth with: eachItem first])].

	anApplication sideNav list: list
