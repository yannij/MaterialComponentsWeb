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

	^ self mcwRegisterDeployment: self applicationPath

]

{ #category : #accessing }
MCWBasicResponsiveApp >> applicationTitle [

	^ 'Responsive Example'
]

{ #category : #initialization }
MCWBasicResponsiveApp >> buildSideNavList [

	^ MDSListGroup new
		addGroupedList: (MCWList new
			"subheader: 'List 1';"
			listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 1' iconName: 'assignment' callback: [ self sideNav menuItemCallback ]);
			listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 2' iconName: 'bug_report' callback: [ self sideNav menuItemCallback ]);
			listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 3' iconName: 'build' callback: [ self sideNav menuItemCallback ]);
			listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 4' iconName: 'delete' callback: [ self sideNav menuItemCallback ]);
			yourself);
		addGroupedList: (MCWList new
			subheader: 'List 2';
			listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 5' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 6' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 7' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			listItemAdd: (MDSListItemSeparator new);
			listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 8' iconName: 'star' callback: [ self sideNav menuItemCallback ]);
			listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 9' iconName: 'star' callback: [ self sideNav menuItemCallback ]);
			yourself);
		yourself

]

{ #category : #initialization }
MCWBasicResponsiveApp >> buildSideSheet [

	^ MDSSideSheet new
		component: self buildSideSheetList;
		yourself
]

{ #category : #initialization }
MCWBasicResponsiveApp >> buildSideSheetList [

	^ MDSListGroup new
		addGroupedList: (MCWList new
			subheader: 'Categories';
			listItemAdd: (MCWListItemIcon  itemText: 'Item A1' iconName: nil callback: [  ]);
			listItemAdd: (MDSListItemSeparator new);
			listItemAdd: (MCWListItemIcon  itemText: 'Item A2' iconName: nil callback: [  ]);
			listItemAdd: (MDSListItemSeparator new);
			listItemAdd: (MCWListItemIcon  itemText: 'Item A3' iconName: nil callback: [  ]);
			yourself);
		addGroupedList: (MCWList new
			subheader: 'Category';
			listItemAdd: (MCWListItemIcon  itemText: 'Item B1' iconName: nil callback: [  ]);
			yourself);
		yourself
]

{ #category : #initialization }
MCWBasicResponsiveApp >> initializeLayout [

	self materialVersionDefault.

	self settings: self buildApplicationSettings.
	self layout: self buildLayout.
	self sideNavTitlesSet.
	self layout beDesktopStyle.
	self layout contentArea component: (String loremIpsum: 5000).
]

{ #category : #initialization }
MCWBasicResponsiveApp >> sideNavTitlesSet [

	self sideNav
		drawerTitle: 'Example';
		drawerSubtitle: 'Sub-example';
		yourself
]

{ #category : #updating }
MCWBasicResponsiveApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: (MCWBasicResponsiveLibrary urlOf: #appCss).

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
