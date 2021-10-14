"
A realization of the Material Design  layout structures described at: https://material.io/guidelines/layout/structure.html
"
Class {
	#name : #MDSBasicResponsiveApp,
	#superclass : #MDSResponsiveApp,
	#instVars : [
		'layout',
		'contentArea',
		'topAppBar',
		'sideNav',
		'sideSheet'
	],
	#category : #'Material-Web-Demo'
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

{ #category : #building }
MDSBasicResponsiveApp >> buildLayout [
	| newLayout |

	newLayout := MDSDesktopLayout on: self.

	self sideNav: (MDSDrawer content: self buildList title: self applicationTitle).
	self topAppBar: (MDSTopAppBar title: self applicationTitle).
	self contentArea: MDSContentArea new.
	self sideSheet: self buildSideSheet.

	^ newLayout
]

{ #category : #building }
MDSBasicResponsiveApp >> buildList [
	| newObject |

	newObject := MDSList new.
	newObject itemsAdd: (MDSListItem label: 'Label 1' icon: 'waves' callback: [  ]).
	newObject itemsAdd: (MDSListItem label: 'Label 2' icon: 'shield' callback: [  ]).
	newObject itemsAdd: (MDSListItem label: 'Label 3' icon: 'face' callback: [  ]).
	
	^ newObject
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildSideNavList [

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
MDSBasicResponsiveApp >> buildSideSheet [

	^ MDSSideSheet new
		component: self buildSideSheetList;
		yourself
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildSideSheetList [

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

{ #category : #accessing }
MDSBasicResponsiveApp >> contentArea [

	^ contentArea
]

{ #category : #accessing }
MDSBasicResponsiveApp >> contentArea: anObject [

	contentArea := anObject
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
	self layout: self buildLayout.
	self sideNavTitlesSet.
	self contentArea component: (String loremIpsum: 5000).
]

{ #category : #accessing }
MDSBasicResponsiveApp >> layout [

	^ layout
]

{ #category : #accessing }
MDSBasicResponsiveApp >> layout: anObject [

	layout := anObject
]

{ #category : #rendering }
MDSBasicResponsiveApp >> renderContentOn: html [

	html document addLoadScript: (JSStream on: 'mdc.autoInit()').

	html script with:
		'var bodyStyle = document.querySelector("body").style;'
		, 'bodyStyle.setProperty("--mdc-theme-primary", "#0088F0");'.

	self renderLayoutOn: html.

	self renderMaterialComponentsWebJsOn: html
]

{ #category : #rendering }
MDSBasicResponsiveApp >> renderLayoutOn: html [

	html render: self layout
]

{ #category : #accessing }
MDSBasicResponsiveApp >> sideNav [

	^ sideNav
]

{ #category : #accessing }
MDSBasicResponsiveApp >> sideNav: anObject [

	sideNav := anObject
]

{ #category : #initialization }
MDSBasicResponsiveApp >> sideNavTitlesSet [

	self sideNav
		title: 'Example';
		subtitle: 'Sub-example';
		yourself
]

{ #category : #accessing }
MDSBasicResponsiveApp >> sideSheet [

	^ sideSheet
]

{ #category : #accessing }
MDSBasicResponsiveApp >> sideSheet: anObject [

	sideSheet := anObject
]

{ #category : #accessing }
MDSBasicResponsiveApp >> snackbarText [
	"TODO: added to be compatible with MCW layout class"

	^ nil
]

{ #category : #accessing }
MDSBasicResponsiveApp >> topAppBar [

	^ topAppBar
]

{ #category : #accessing }
MDSBasicResponsiveApp >> topAppBar: anObject [

	topAppBar := anObject
]

{ #category : #updating }
MDSBasicResponsiveApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: (MDSBasicResponsiveLibrary urlOf: #appCss).

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
