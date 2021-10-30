"
I am a demo application that shows an auto-responsive layout (i.e. the layout changes as its window is resized).
"
Class {
	#name : #MDSAutoResponsiveApp,
	#superclass : #MDSResponsiveApp,
	#category : #'Material-Demo-Web'
}

{ #category : #initialization }
MDSAutoResponsiveApp class >> applicationPath [

	^ 'material/auto-responsive'
]

{ #category : #'class initialization' }
MDSAutoResponsiveApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath
]

{ #category : #accessing }
MDSAutoResponsiveApp >> applicationTitle [

	^ 'Auto Responsive'
]

{ #category : #initialization }
MDSAutoResponsiveApp >> buildList [
	| newObject |

	newObject := MDSList new.
	newObject itemsAdd: (MDSListItem label: 'Label 1' icon: 'waves' callback: [ self layout sideNavDismissIfModal ]).
	newObject itemsAdd: (MDSListItem label: 'Label 2' icon: 'shield' callback: [ self layout sideNavDismissIfModal ]).
	newObject itemsAdd: (MDSListItem label: 'Label 3' icon: 'face' callback: [ self layout sideNavDismissIfModal ]).
	
	^ newObject
]

{ #category : #initialization }
MDSAutoResponsiveApp >> buildPopupMenuSettings [
	| list |

	list := (MDSMenuList id: 'settingsPopup')
		"itemsAdd: (MDSListItem iconName: 'waves' itemText: 'Responsive' callback: [ self toggleAutoResponsive ]);"
		itemsAdd: (MDSListItem iconName: 'view_sidebar' itemText: 'Side Sheet' callback: [ self layout sideSheetHiddenToggle ]);
		itemsAdd: (MDSListItem iconName: 'minimize' itemText: 'Collapse' callback: [ self layout topAppBarCollapsedToggle ]);
		itemsAdd: (MDSListItem iconName: 'all_out' itemText: 'Dense' callback: [ self layout denseViewToggle ]);
		"itemsAdd: (MDSListItem iconName: 'color_lens' itemText: 'Style' callback: [ self configureStyle ]);
		itemsAdd: (MDSListItem iconName: 'login' itemText: 'Login' callback: [ self login ]);
		itemsAdd: (MDSListItem iconName: 'logout' itemText: 'Logout' callback: [ self logout ]);"
		yourself.

	^ list
]

{ #category : #initialization }
MDSAutoResponsiveApp >> buildSideSheetList [

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
MDSAutoResponsiveApp >> initialize [

	super initialize.

	self materialVersionDefault.

	self layout: (MDSLayoutAutoResponsive on: self).
	self setupLayout
]

{ #category : #rendering }
MDSAutoResponsiveApp >> renderLayoutOn: html [

	html script with:
		'var bodyStyle = document.querySelector("body").style;'
		, 'bodyStyle.setProperty("--mdc-theme-primary", "#0088F0");'.

	html render: self layout
]

{ #category : #initialization }
MDSAutoResponsiveApp >> setupLayout [

	self setupTopAppBar.
	self layout sideNav content: self buildList; title: 'Example'; subtitle: 'Sub-example'.
	self layout bodyRegion component: (String loremIpsum: 5000).
	self layout sideSheet component: self buildSideSheetList.
	self layout initializeComplete
]

{ #category : #initialization }
MDSAutoResponsiveApp >> setupTopAppBar [
	| settingsPopup |

	settingsPopup := self buildPopupMenuSettings.

	self layout topAppBar
		title: self applicationTitle;
		startSectionAdd: self buildNavigationIcon;
		endSectionAdd: (MDSTopAppBarActionItem materialIcon: 'settings' onClickScript: settingsPopup openScript);
		endSectionAdd: settingsPopup
]

{ #category : #updating }
MDSAutoResponsiveApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: (MDSBasicResponsiveLibrary urlOf: #appCss)
]
