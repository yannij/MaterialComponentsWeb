"
I am a demo application that presents a realization of the Material Design layout structures described at: https://material.io/design/layout/understanding-layout.html#layout-anatomy. Menu popup actions provide for manually switching the layout amongst Phone, Tablet, Laptop, and Desktop layouts. Additionally, (1) the Top App Bar can be collapsed, (2) the component Density can be toggled from dense/normal, and (3) a Side Sheet can be toggled from hidden/visible.
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
MDSBasicResponsiveApp >> buildList [
	| newObject |

	newObject := MDSList new.
	newObject itemsAdd: (MDSListItem label: 'Label 1' icon: 'waves' callback: [ self sideNav dismissIfModel ]).
	newObject itemsAdd: (MDSListItem label: 'Label 2' icon: 'shield' callback: [ self sideNav dismissIfModel ]).
	newObject itemsAdd: (MDSListItem label: 'Label 3' icon: 'face' callback: [ self sideNav dismissIfModel ]).
	
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
MDSBasicResponsiveApp >> initialize [

	super initialize.

	self materialVersionDefault.

	self layout: (MDSLayoutMedium on: self).
	self setupLayout
]

{ #category : #rendering }
MDSBasicResponsiveApp >> layoutChange: anMDSLayoutClass [

	self layout: (anMDSLayoutClass on: self).
	self setupLayout
]

{ #category : #rendering }
MDSBasicResponsiveApp >> renderLayoutOn: html [

	html script with:
		'var bodyStyle = document.querySelector("body").style;'
		, 'bodyStyle.setProperty("--mdc-theme-primary", "#0088F0");'.

	html render: self layout
]

{ #category : #initialization }
MDSBasicResponsiveApp >> setupLayout [

	self setupTopAppBar.
	self layout sideNav content: self buildList; title: 'Example'; subtitle: 'Sub-example'.
	self layout bodyRegion component: (String loremIpsum: 5000).
	self layout sideSheet component: self buildSideSheetList.
	self layout initializeComplete
]

{ #category : #initialization }
MDSBasicResponsiveApp >> setupTopAppBar [
	| settingsPopup |

	settingsPopup := self buildPopupMenuSettings.

	self layout topAppBar
		title: self applicationTitle;
		startSectionAdd: self buildNavigationIcon;
		endSectionAdd: (MDSTopAppBarActionItem materialIcon: 'settings' onClickScript: settingsPopup openScript);
		endSectionAdd: settingsPopup
]

{ #category : #updating }
MDSBasicResponsiveApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: (MDSBasicResponsiveLibrary urlOf: #appCss)
]
