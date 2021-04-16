"
A realization of the Material Design  layout structures described at: https://material.io/guidelines/layout/structure.html
"
Class {
	#name : #MCWBasicResponsiveApp,
	#superclass : #MCWResponsiveApplication,
	#category : #'Material-Web-Demo'
}

{ #category : #initialization }
MCWBasicResponsiveApp class >> applicationPath [

	^ 'material/basic-layout'
]

{ #category : #'class initialization' }
MCWBasicResponsiveApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self registerMaterialWebDeployment: self applicationPath

]

{ #category : #accessing }
MCWBasicResponsiveApp >> applicationTitle [

	^ 'Layout Example'
]

{ #category : #initialization }
MCWBasicResponsiveApp >> buildSideNavList [

	^ MCWListGroup new
		addGroupedList: (MCWListBasic new
			"subheader: 'List 1';"
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 1' iconName: 'assignment' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 2' iconName: 'bug_report' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 3' iconName: 'build' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 4' iconName: 'delete' callback: [ self sideNav menuItemCallback ]);
			yourself);
		addGroupedList: (MCWListBasic new
			subheader: 'List 2';
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 5' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 6' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 7' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemSeparator new);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 8' iconName: 'star' callback: [ self sideNav menuItemCallback ]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 9' iconName: 'star' callback: [ self sideNav menuItemCallback ]);
			yourself);
		yourself

]

{ #category : #initialization }
MCWBasicResponsiveApp >> buildSideSheet [

	^ MCWSideSheet new
]

{ #category : #initialization }
MCWBasicResponsiveApp >> buildSideSheetList [

	^ MCWListGroup new
		addGroupedList: (MCWListBasic new
			subheader: 'Categories';
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: [ ]);
			addListItem: (MCWListItemSeparatorInset new);
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: [ ]);
			addListItem: (MCWListItemSeparatorInset new);
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: [ ]);
			addListItem: (MCWListItemSeparatorInset new);
			addListItem: (MCWListItemSelectionControl itemText: 'Category' callback: [ ]);
			yourself);
		addGroupedList: (MCWListBasic new
			subheader: 'Category';
			addListItem: (MCWListItemSlider itemText: 'Category' callback: [ ]);
			yourself);
		addGroupedList: (MCWListBasic new
			subheader: 'Category';
			addListItem: (MCWListItemSlider itemText: 'Category' callback: [ ]);
			yourself);
		yourself

]

{ #category : #accessing }
MCWBasicResponsiveApp >> drawerSubtitle [

	^ 'Sub-example'
]

{ #category : #accessing }
MCWBasicResponsiveApp >> drawerTitle [

	^ 'Example'
]

{ #category : #updating }
MCWBasicResponsiveApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: (MCWBasicResponsiveLibrary urlOf: #appCss).

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
