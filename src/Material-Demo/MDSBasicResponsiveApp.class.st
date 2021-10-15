"
A realization of the Material Design  layout structures described at: https://material.io/guidelines/layout/structure.html
"
Class {
	#name : #MDSBasicResponsiveApp,
	#superclass : #MDSResponsiveApp,
	#category : #'Material-Demo-Web'
}

{ #category : #initialization }
MDSBasicResponsiveApp class >> applicationPath [

	^ 'material/basic-responsive'
]

{ #category : #'class initialization' }
MDSBasicResponsiveApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath
]

{ #category : #accessing }
MDSBasicResponsiveApp >> applicationTitle [

	^ 'Basic Responsive'
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildBodyRegion [

	^ MDSContentArea new
		component: (String loremIpsum: 5000);
		yourself
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildLayout [

	^ MDSDesktopLayout on: self
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildList [
	| newObject |

	newObject := MDSList new.
	newObject itemsAdd: (MDSListItem label: 'Label 1' icon: 'waves' callback: [  ]).
	newObject itemsAdd: (MDSListItem label: 'Label 2' icon: 'shield' callback: [  ]).
	newObject itemsAdd: (MDSListItem label: 'Label 3' icon: 'face' callback: [  ]).
	
	^ newObject
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildSideNav [

	^ (MDSDrawer content: self buildList title: self applicationTitle)
		title: 'Example';
		subtitle: 'Sub-example';
		yourself
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildSideNavList [

	^ MDSListGroup new
		addGroupedList: (MDSList new
			"subheader: 'List 1';"
			itemsAdd: (MDSListItem itemText: 'Nav Item 1' iconName: 'assignment' callback: [ self sideNav menuItemCallback ]);
			itemsAdd: (MDSListItem itemText: 'Nav Item 2' iconName: 'bug_report' callback: [ self sideNav menuItemCallback ]);
			itemsAdd: (MDSListItem itemText: 'Nav Item 3' iconName: 'build' callback: [ self sideNav menuItemCallback ]);
			itemsAdd: (MDSListItem itemText: 'Nav Item 4' iconName: 'delete' callback: [ self sideNav menuItemCallback ]);
			yourself);
		addGroupedList: (MDSList new
			subheader: 'List 2';
			itemsAdd: (MDSListItem itemText: 'Nav Item 5' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			itemsAdd: (MDSListItem itemText: 'Nav Item 6' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			itemsAdd: (MDSListItem itemText: 'Nav Item 7' iconName: 'face' callback: [ self sideNav menuItemCallback ]);
			itemsAdd: (MDSListItemSeparator new);
			itemsAdd: (MDSListItem itemText: 'Nav Item 8' iconName: 'star' callback: [ self sideNav menuItemCallback ]);
			itemsAdd: (MDSListItem itemText: 'Nav Item 9' iconName: 'star' callback: [ self sideNav menuItemCallback ]);
			yourself);
		yourself

]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildSideSheet [

	^ MDSSideSheet new
		component: self buildSideSheetList;
		yourself
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildSideSheetList [

	^ MDSListGroup new
		addGroupedList: (MDSList new
			subheader: 'Categories';
			itemsAdd: (MDSListItem itemText: 'Item A1' iconName: nil callback: [  ]);
			itemsAdd: (MDSListItemSeparator new);
			itemsAdd: (MDSListItem itemText: 'Item A2' iconName: nil callback: [  ]);
			itemsAdd: (MDSListItemSeparator new);
			itemsAdd: (MDSListItem itemText: 'Item A3' iconName: nil callback: [  ]);
			yourself);
		addGroupedList: (MDSList new
			subheader: 'Category';
			itemsAdd: (MDSListItem itemText: 'Item B1' iconName: nil callback: [  ]);
			yourself);
		yourself
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildTopAppBar [

	^ (MDSTopAppBar title: self applicationTitle)
		startSectionAdd: self buildNavigationIcon;
		yourself
]

{ #category : #initialization }
MDSBasicResponsiveApp >> initialize [

	super initialize.

	self initializeLayout
]

{ #category : #initialization }
MDSBasicResponsiveApp >> initializeLayout [

	self materialVersionDefault.

	"self settings: self buildApplicationSettings."
	self topAppBar: self buildTopAppBar .
	self sideNav: self buildSideNav.
	self bodyRegion: self buildBodyRegion.
	self sideSheet: self buildSideSheet.
	self layout: self buildLayout.
]

{ #category : #rendering }
MDSBasicResponsiveApp >> renderLayoutOn: html [

	html script with:
		'var bodyStyle = document.querySelector("body").style;'
		, 'bodyStyle.setProperty("--mdc-theme-primary", "#0088F0");'.

	html render: self layout
]

{ #category : #updating }
MDSBasicResponsiveApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: (MDSBasicResponsiveLibrary urlOf: #appCss)
]
