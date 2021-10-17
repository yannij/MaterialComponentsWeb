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

	^ MDSBodyRegion new
		component: (String loremIpsum: 5000);
		yourself
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildLayout [

	^ (MDSLayoutMedium on: self)
		initializeComplete;
		yourself
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildList [
	| newObject |

	newObject := MDSList new.
	newObject itemsAdd: (MDSListItem label: 'Label 1' icon: 'waves' callback: [ self sideNav menuItemCallback ]).
	newObject itemsAdd: (MDSListItem label: 'Label 2' icon: 'shield' callback: [ self sideNav menuItemCallback ]).
	newObject itemsAdd: (MDSListItem label: 'Label 3' icon: 'face' callback: [ self sideNav menuItemCallback ]).
	
	^ newObject
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildPopupMenuSettings [
	| list |

	list := (MDSMenuList id: 'settingsPopup')
		itemsAdd: (MDSListItem iconName: 'smartphone' itemText: 'Phone' callback: [ self layoutChange: MDSLayoutExtraSmall ]);
		itemsAdd: (MDSListItem iconName: 'tablet' itemText: 'Tablet' callback: [ self layoutChange: MDSLayoutSmall ]);
		itemsAdd: (MDSListItem iconName: 'laptop' itemText: 'Laptop' callback: [ self layoutChange: MDSLayoutMedium ]);
		itemsAdd: (MDSListItem iconName: 'monitor' itemText: 'Desktop' callback: [ self layoutChange: MDSLayoutLarge ]);
		itemsAdd: (MDSListItem iconName: 'view_sidebar' itemText: 'Side Sheet' callback: [ self layout sideSheetHiddenToggle ]);
		"itemsAdd: (MDSListItem iconName: 'waves' itemText: 'Responsive' callback: [ self toggleAutoResponsive ]);"
		itemsAdd: (MDSListItem iconName: 'minimize' itemText: 'Collapse' callback: [ self layout topAappBarCollapsedToggle ]);
		itemsAdd: (MDSListItem iconName: 'all_out' itemText: 'Dense' callback: [ self layout denseViewToggle ]);
		"itemsAdd: (MDSListItem iconName: 'color_lens' itemText: 'Style' callback: [ self configureStyle ]);
		itemsAdd: (MDSListItem iconName: 'login' itemText: 'Login' callback: [ self login ]);
		itemsAdd: (MDSListItem iconName: 'logout' itemText: 'Logout' callback: [ self logout ]);"
		yourself.

	^ list
]

{ #category : #initialization }
MDSBasicResponsiveApp >> buildSideNav [

	^ (MDSDrawer content: self buildList title: self applicationTitle)
		title: 'Example';
		subtitle: 'Sub-example';
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
	| settingsPopup |

	settingsPopup := self buildPopupMenuSettings.

	^ (MDSTopAppBar title: self applicationTitle)
		startSectionAdd: self buildNavigationIcon;
		endSectionAdd: (MDSTopAppBarActionItem materialIcon: 'settings' onClickScript: settingsPopup openScript);
		endSectionAdd: settingsPopup;
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
	self layout: self buildLayout
]

{ #category : #rendering }
MDSBasicResponsiveApp >> layoutChange: anMDSLayoutClass [
	| newLayout |

	newLayout := (anMDSLayoutClass on: self)
		initializeComplete;
		yourself.
	self layout: newLayout
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
