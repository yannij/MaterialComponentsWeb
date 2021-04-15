"
Subclasses may specialize to implement a ResponsiveUI as described at: https://material.io/guidelines/layout/structure.html
"
Class {
	#name : #MCWResponsiveApplication,
	#superclass : #MCWApplication,
	#instVars : [
		'layout',
		'settings',
		'loginComponent'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #initialization }
MCWResponsiveApplication >> appBarEndSection [
	| data settingsPopup |

	settingsPopup := self buildPopupMenuSettings.

	data := OrderedCollection new.
	data
		add: ((MCWAppBarMenuIcon materialIcon: 'settings') ariaLabel: 'Settings'; onClickScript: settingsPopup openScript; yourself);
		add: settingsPopup;
		yourself.

	"These buttons are here because persistent side nav causes toolbar to be pushed right"
	"5 timesRepeat: [data add: (MCWAppBarMenuIcon materialIcon: 'bookmark')]."

	^ data

]

{ #category : #initialization }
MCWResponsiveApplication >> appBarStartSection [

	^ Array
		"with: self sideNav getMenuIcon"
		with: self buildMenuIconPersistent
]

{ #category : #initialization }
MCWResponsiveApplication >> appBarTitle [

	^ 'Top app bar'

]

{ #category : #accessing }
MCWResponsiveApplication >> applicationTitle [

	self subclassResponsibility
]

{ #category : #actions }
MCWResponsiveApplication >> beLayoutStructureDesktop [

	self layout beDesktopStyle

]

{ #category : #actions }
MCWResponsiveApplication >> beLayoutStructureMobile [

	self layout beMobileStyle
]

{ #category : #actions }
MCWResponsiveApplication >> beLayoutStructureTablet [

	self layout beTabletStyle
]

{ #category : #updating }
MCWResponsiveApplication >> bodyCssClasses [
	"Subclasses may override"

	^ #("'mdc-typography'" 'mcw-body')
]

{ #category : #initialization }
MCWResponsiveApplication >> buildApplicationSettings [

	^ MCWApplicationSettings newDefault
]

{ #category : #initialization }
MCWResponsiveApplication >> buildLayout [

	^ MCWLayout new
		primaryRegionSet: MCWContentArea new;
		sideNav: self buildSideNav;
		sideSheetSet: self buildSideSheet;
		mainFab: self buildMainFab;
		topAppBar: self buildTopAppBar;
		yourself
]

{ #category : #initialization }
MCWResponsiveApplication >> buildMainFab [

	^ MCWFloatingActionButton new
		beMiniFab;
		beRippledFab;
		yourself.

]

{ #category : #initialization }
MCWResponsiveApplication >> buildMenuIconPersistent [

	^ (MCWAppBarMenuIcon materialIcon: 'menu') ariaLabel: 'Menu'; callback: [ self toggleDismissibleDrawer ]; yourself

]

{ #category : #initialization }
MCWResponsiveApplication >> buildMenuIconTemporary [

	^ (MCWAppBarMenuIcon materialIcon: 'menu') ariaLabel: 'Menu'; onClickScript: self openSideNavScript; yourself

]

{ #category : #initialization }
MCWResponsiveApplication >> buildPopupMenuSettings [
	| list |

	list := (MCWListMenuItems id: 'settingsPopup')
		addListItem: (MCWListItemIcon new iconName: 'cancel'; itemText: 'Cancel'; yourself);
		addListItem: (MCWListItemIcon new iconName: 'smartphone'; itemText: 'Phone'; callback: [ self beLayoutStructureMobile ]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'tablet'; itemText: 'Tablet'; callback: [ self beLayoutStructureTablet ]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'computer'; itemText: 'Desktop'; callback: [ self beLayoutStructureDesktop ]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'color_lens'; itemText: 'Colors'; callback: [ self chooseColors ]; yourself);
		addListItem: (MCWListItemIcon new iconName: 'minimize'; itemText: 'Collapse App Bar'; callback: [ self toggleAppBarCollapse ]; yourself);
		yourself.

	"self layout sideSheet notNil
		ifTrue: [
			list addListItem:
				(MCWListItemIcon new iconName: 'more_horiz'; itemText: 'Side Sheet'; onClickScript: self openRidghtNavScript; yourself)]."

	^ list
]

{ #category : #initialization }
MCWResponsiveApplication >> buildSideNav [

	^ MCWDrawer new
		id: self sideNavDrawerId;
		drawerTitle: self drawerTitle;
		drawerSubtitle: self drawerSubtitle;
		list: self buildSideNavList;
		menuIconPersistent: self buildMenuIconPersistent;
		"menuIconTemporary: self buildMenuIconTemporary;"
		menuIconTemporary: self buildMenuIconPersistent;
		yourself.

]

{ #category : #initialization }
MCWResponsiveApplication >> buildSideNavList [

	^ MCWListBasic new
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 1' iconName: 'assignment' callback: [ self sideNav menuItemCallback ]);
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 2' iconName: 'bug_report' callback: [ self sideNav menuItemCallback ]);
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 3' iconName: 'build' callback: [ self sideNav menuItemCallback ]);
		addListItem: (MCWListItemIcon  itemText: 'Nav Item 4' iconName: 'delete' callback: [ self sideNav menuItemCallback ]);
		yourself.

]

{ #category : #initialization }
MCWResponsiveApplication >> buildSideSheet [

	^ nil

]

{ #category : #initialization }
MCWResponsiveApplication >> buildSideSheetList [

	^ nil
]

{ #category : #initialization }
MCWResponsiveApplication >> buildTopAppBar [

	^ MCWTopAppBar new
		toolbarTitle: (MCWTopAppBarTtile titled: self appBarTitle);
		startSection: self appBarStartSection;
		endSection: self appBarEndSection;
		yourself

]

{ #category : #actions }
MCWResponsiveApplication >> chooseColors [

	self layout contentArea component notNil
		ifTrue: [ self layout contentArea component: nil ]
		ifFalse: [ self layout contentArea component: (self settings colorTheme asComponent addValidatedForm) ]

]

{ #category : #accessing }
MCWResponsiveApplication >> colorThemeCss [
	| aStream |

	aStream := WriteStream on: String new.
	aStream nextPutAll: ':root {'.
	aStream nextPutAll: '--mdc-typography-font-family: Rubik, sans-serif;'.
	self settings colorTheme keysAndValuesDo: [ :eachKey :eachValue |
		aStream
			nextPutAll: '--mdc-theme-'; nextPutAll: eachKey;
			nextPutAll: ': '; nextPutAll: eachValue; nextPut: $;;
			yourself ].
	aStream nextPutAll: '}'.
	^ aStream contents
]

{ #category : #actions }
MCWResponsiveApplication >> colorThemeExample [
	| libraryHandler library |

	#(
"('primary' '#3f51b5')"
('primary' 'green')
('primary-light' '#757de8')
('primary-dark' '#002984')
('secondary' '#e91e63')
('secondary-light' '#ff6090')
('secondary-dark' '#b0003a')
('background' '#fff')
	) do: [ :each |
		self colorTheme at: each first put: each second ].

	libraryHandler := (WADispatcher default handlerAt: 'files') libraryAt: 'MCWCustomizableLibrary' ifAbsent: [ ].
	libraryHandler notNil
		ifTrue: [
			library := libraryHandler default.
			library colorThemeCss: self colorThemeCss ].
]

{ #category : #actions }
MCWResponsiveApplication >> colorThemeExampleClear [
	| libraryHandler library |

	self colorTheme removeAll.

	libraryHandler := (WADispatcher default handlerAt: 'files') libraryAt: 'MCWCustomizableLibrary' ifAbsent: [ ].
	libraryHandler notNil
		ifTrue: [
			library := libraryHandler default.
			library colorThemeCss: self colorThemeCss ].
]

{ #category : #rendering }
MCWResponsiveApplication >> currentFont [

	^ self settings fontSettings font
]

{ #category : #accessing }
MCWResponsiveApplication >> drawerSubtitle [

	^ ''
]

{ #category : #accessing }
MCWResponsiveApplication >> drawerTitle [

	^ ''
]

{ #category : #initialization }
MCWResponsiveApplication >> initialize [

	super initialize.

	"self materialVersion100."
	self materialVersionLocalServer.
	"self materialVersion: '10.0.0'."
	self settings: self buildApplicationSettings.
	"self loginComponent: MCWLogin new."
	self layout: self buildLayout.
	self beLayoutStructureDesktop.

	"Subclasses may invoke #applicationPostInitialize: if necessary"
	"self applicationPostInitialize: self"

]

{ #category : #testing }
MCWResponsiveApplication >> isLoggedIn [

	self session ifNil: [ ^ false ].

	(self session properties at: #authenticatedUser ifAbsent: [ nil ])
		ifNil: [ ^ false ]
		ifNotNil: [ :value | ^ value notNil ]
]

{ #category : #accessing }
MCWResponsiveApplication >> layout [
	^ layout
]

{ #category : #accessing }
MCWResponsiveApplication >> layout: anObject [
	layout := anObject
]

{ #category : #accessing }
MCWResponsiveApplication >> loginComponent [
	^ loginComponent
]

{ #category : #accessing }
MCWResponsiveApplication >> loginComponent: anObject [
	loginComponent := anObject
]

{ #category : #initialization }
MCWResponsiveApplication >> materialVersion100 [
	"Use 1.0.0 unpkg.com"

	self materialVersion: '1.0.0'
]

{ #category : #initialization }
MCWResponsiveApplication >> materialVersionLatest [
	"Use latest version from unpkg.com"

	self materialVersion: ''
]

{ #category : #initialization }
MCWResponsiveApplication >> materialVersionLocalServer [
	"Use version served by Seaside"

	self materialVersion: nil
]

{ #category : #initialization }
MCWResponsiveApplication >> openRidghtNavScript [

	^ 'element = document.getElementById(''', self rightNavDrawerId, ''');
element.mdcDrawer.open = !element.mdcDrawer.open'
]

{ #category : #initialization }
MCWResponsiveApplication >> openSideNavScript [

	^ 'element = document.getElementById(''', self sideNavDrawerId, ''');
element.mdcDrawer.open = !element.mdcDrawer.open'
]

{ #category : #rendering }
MCWResponsiveApplication >> renderContentOn: html [

	html document addLoadScript: (JSScript new add: (JSStream new nextPutAll: 'mdc.autoInit()'); yourself).

	self renderSetColorThemeOn: html.

	self renderSetGoogleFont: self currentFont on: html.

	(self isLoggedIn or: [ self loginComponent isNil ])
		ifTrue: [ self renderLayoutOn: html ]
		ifFalse: [ self renderLoginOn: html ].

	self renderMaterialComponentsWebJsOn: html
]

{ #category : #rendering }
MCWResponsiveApplication >> renderLayoutOn: html [

	html render: self layout
]

{ #category : #rendering }
MCWResponsiveApplication >> renderLoginOn: html [

	html render: self loginComponent
]

{ #category : #rendering }
MCWResponsiveApplication >> renderSetColorThemeOn: html [
	| stream |

	stream := WriteStream on: String new.

	stream nextPutAll: 'var bodyStyle = document.querySelector("body").style;'.
	self settings colorTheme themeItems keysAndValuesDo: [ :eachKey :eachValue |
		stream
			nextPutAll: 'bodyStyle.setProperty("--mdc-theme-', eachKey, '", "#', eachValue asHexString, '");';
			yourself ].

	html script with: stream contents.

]

{ #category : #rendering }
MCWResponsiveApplication >> renderSetGoogleFont: aGoogleFont on: html [

	html script with: 
		'document.querySelector("body").style.setProperty("--mdc-typography-font-family"'
		, ', "''', aGoogleFont familyName, ''', ', aGoogleFont genericFamily, '")'
]

{ #category : #initialization }
MCWResponsiveApplication >> rightNavDrawerId [

	^ 'rightNavDrawer'

]

{ #category : #'accessing - model' }
MCWResponsiveApplication >> sessionUserGet [

	^ self session properties at: #authenticatedUser ifAbsent: [ nil ]
]

{ #category : #'accessing - model' }
MCWResponsiveApplication >> sessionUserSet: aUser [

	self session properties at: #authenticatedUser put: aUser
]

{ #category : #accessing }
MCWResponsiveApplication >> settings [
	^ settings
]

{ #category : #accessing }
MCWResponsiveApplication >> settings: anObject [
	settings := anObject
]

{ #category : #accessing }
MCWResponsiveApplication >> sideNav [

	^ self layout sideNav
]

{ #category : #initialization }
MCWResponsiveApplication >> sideNavDrawerId [

	^ 'sideNavDrawer'

]

{ #category : #hooks }
MCWResponsiveApplication >> style [

	^ self layout headStyle
]

{ #category : #testing }
MCWResponsiveApplication >> todoScreenWidth [
"
Media Queries work in js too:

if (window.matchMedia('screen and (max-width: 768px)').matches) {}
Another way would be:

var width = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
"
]

{ #category : #actions }
MCWResponsiveApplication >> toggleAppBarCollapse [

	self layout topAppBar shortCollapsed
		ifTrue: [ self layout topAppBar short: false; shortCollapsed: false ]
		ifFalse: [ self layout topAppBar short: true; shortCollapsed: true; dense: false ]

]

{ #category : #actions }
MCWResponsiveApplication >> toggleDismissibleDrawer [

	self layout sideNav dismissedToggle.
	"self layoutComponent adjustToolbarsPersistedSideNav: self sideNav isPersisted."

]

{ #category : #updating }
MCWResponsiveApplication >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot link relationship: 'dns-prefetch'; url: '//fonts.googleapis.com'.

	self updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: MCWResponsiveAppLibrary / #responsiveAppCss.

	anHtmlRoot title: self applicationTitle.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		attributeAt: 'content' put: 'width=device-width, initial-scale=1'.

	self bodyCssClasses do: [ :each | anHtmlRoot bodyAttributes addClass: each ]
]

{ #category : #updating }
MCWResponsiveApplication >> updateRootFonts: anHtmlRoot [

	super updateRootFonts: anHtmlRoot.

	"fontNames := 'Roboto|Roboto+Condensed|Bree+Serif|Fontdiner+Swanky|Open+Sans|Oxygen+Mono|Pacifico'."
	"fontNames := '|' join: (self fonts collect: [:eachChoice | eachChoice googleFontsFamily])."

	self settings fontSettings fontChoices do: [ :eachChoice |
		anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=', eachChoice googleFontsFamily) ].

]
