"
Subclasses may specialize to implement a ResponsiveUI as described at: https://material.io/guidelines/layout/structure.html
"
Class {
	#name : #MCWResponsiveApplication,
	#superclass : #MCWApplication,
	#instVars : [
		'layout',
		'settings',
		'loginComponent',
		'snackbarText'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #testing }
MCWResponsiveApplication >> anonymousLoginAllowed [

	^ true
]

{ #category : #initialization }
MCWResponsiveApplication >> appBarEndSection [
	| data settingsPopup |

	settingsPopup := self buildPopupMenuSettings.

	data := OrderedCollection new.
	data
		"add: ((MCWAppBarMenuIcon materialIcon: 'more_horiz') ariaLabel: 'Side Sheet'; callback: [ self toggleSideSheet ]; yourself);"
		add: ((MCWAppBarMenuIcon materialIcon: 'settings') ariaLabel: 'Settings'; onClickScript: settingsPopup openScript; yourself);
		add: settingsPopup;
		yourself.

	^ data

]

{ #category : #initialization }
MCWResponsiveApplication >> appBarStartSection [

	^ Array
		"with: self sideNav getMenuIcon"
		with: self buildMenuIconPersistent
]

{ #category : #accessing }
MCWResponsiveApplication >> applicationTitle [

	self subclassResponsibility
]

{ #category : #actions }
MCWResponsiveApplication >> beLayoutStructureDesktop [

	self layout isDesktopStyle ifFalse: [
		self layout beDesktopStyle ]
]

{ #category : #actions }
MCWResponsiveApplication >> beLayoutStructureLaptop [

	self layout isLaptopStyle ifFalse: [
		self layout beLaptopStyle ]
]

{ #category : #actions }
MCWResponsiveApplication >> beLayoutStructurePhone [

	self layout isPhoneStyle ifFalse: [
		self layout bePhoneStyle ]
]

{ #category : #actions }
MCWResponsiveApplication >> beLayoutStructureTablet [

	self layout isTabletStyle ifFalse: [
		self layout beTabletStyle ]
]

{ #category : #updating }
MCWResponsiveApplication >> bodyCssClasses [
	"Subclasses may override"

	^ #("'mdc-typography'" 'mcw-body')
]

{ #category : #initialization }
MCWResponsiveApplication >> buildApplicationSettings [

	^ MCWApplicationSettings new
]

{ #category : #initialization }
MCWResponsiveApplication >> buildLayout [
	| newLayout newSideNav newTopAppBar newContentArea |

	newLayout := MCWResponsiveLayout on: self.
	newSideNav := self buildSideNav layout: newLayout; yourself.
	newTopAppBar := self buildTopAppBar layout: newLayout; yourself.
	newContentArea := MCWContentArea on: newLayout.
	newLayout
		contentArea: newContentArea;
		sideNav: newSideNav;
		sideSheet: self buildSideSheet;
		mainFab: self buildMainFab;
		topAppBar: newTopAppBar;
		yourself.
	^ newLayout
]

{ #category : #initialization }
MCWResponsiveApplication >> buildLoginComponent [

	^ nil

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
		listItemAdd: (MCWListItemIcon new iconName: 'smartphone'; itemText: 'Phone'; callback: [ self beLayoutStructurePhone ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'tablet'; itemText: 'Tablet'; callback: [ self beLayoutStructureTablet ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'laptop'; itemText: 'Laptop'; callback: [ self beLayoutStructureLaptop ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'monitor'; itemText: 'Desktop'; callback: [ self beLayoutStructureDesktop ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'view_sidebar'; itemText: 'Side Sheet'; callback: [ self toggleSideSheet ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'waves'; itemText: 'Responsive'; callback: [ self toggleAutoResponsive ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'minimize'; itemText: 'Collapse'; callback: [ self toggleAppBarCollapse ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'all_out'; itemText: 'Dense'; callback: [ self toggleDenseView ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'color_lens'; itemText: 'Style'; callback: [ self configureStyle ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'login'; itemText: 'Login'; callback: [ self login ]; yourself);
		listItemAdd: (MCWListItemIcon new iconName: 'logout'; itemText: 'Logout'; callback: [ self logout ]; yourself);
		yourself.

	^ list
]

{ #category : #initialization }
MCWResponsiveApplication >> buildSideNav [

	^ MCWDrawer new
		id: self sideNavDrawerId;
		list: self buildSideNavList;
		menuIconPersistent: self buildMenuIconPersistent;
		"menuIconTemporary: self buildMenuIconTemporary;"
		menuIconTemporary: self buildMenuIconPersistent;
		yourself.

]

{ #category : #initialization }
MCWResponsiveApplication >> buildSideNavList [

	^ MCWListBasic new
		listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 1' iconName: 'assignment' callback: [ self sideNav menuItemCallback ]);
		listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 2' iconName: 'bug_report' callback: [ self sideNav menuItemCallback ]);
		listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 3' iconName: 'build' callback: [ self sideNav menuItemCallback ]);
		listItemAdd: (MCWListItemIcon  itemText: 'Nav Item 4' iconName: 'delete' callback: [ self sideNav menuItemCallback ]);
		yourself.

]

{ #category : #initialization }
MCWResponsiveApplication >> buildSideSheet [

	^ nil

]

{ #category : #initialization }
MCWResponsiveApplication >> buildTopAppBar [

	^ MCWTopAppBar new
		appBarTitle: self applicationTitle;
		startSection: self appBarStartSection;
		endSection: self appBarEndSection;
		yourself

]

{ #category : #accessing }
MCWResponsiveApplication >> colorThemeCss [
	| aStream |

	aStream := WriteStream on: String new.
	aStream nextPutAll: ':root {'.
	aStream nextPutAll: '--mdc-typography-font-family: Rubik, sans-serif;'.
	self settings mdcTheme keysAndValuesDo: [ :eachKey :eachValue |
		aStream
			nextPutAll: '--mdc-theme-'; nextPutAll: eachKey;
			nextPutAll: ': '; nextPutAll: eachValue; nextPut: $;;
			yourself ].
	aStream nextPutAll: '}'.
	^ aStream contents
]

{ #category : #actions }
MCWResponsiveApplication >> configureStyle [

	self layout settingsView toggleHiddenValue
]

{ #category : #accessing }
MCWResponsiveApplication >> denseView [

	^ self settings denseView
]

{ #category : #actions }
MCWResponsiveApplication >> dismissMenuIfModalDrawer [

	self sideNav menuItemCallback
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

	self initializeLayout
]

{ #category : #initialization }
MCWResponsiveApplication >> initializeLayout [

	self subclassResponsibility
]

{ #category : #testing }
MCWResponsiveApplication >> isAutoResponsive [

	^ self settings autoResponsive
]

{ #category : #testing }
MCWResponsiveApplication >> isLoggedIn [

	^ self loginComponent notNil and: [ self loginComponent isLoggedIn ]
]

{ #category : #accessing }
MCWResponsiveApplication >> layout [
	^ layout
]

{ #category : #accessing }
MCWResponsiveApplication >> layout: anObject [
	layout := anObject
]

{ #category : #actions }
MCWResponsiveApplication >> login [

	self loginComponent
		ifNil: [
			self loginComponent: self buildLoginComponent.
			self redirectToLogin ]
]

{ #category : #accessing }
MCWResponsiveApplication >> loginComponent [
	^ loginComponent
]

{ #category : #accessing }
MCWResponsiveApplication >> loginComponent: anObject [
	loginComponent := anObject
]

{ #category : #actions }
MCWResponsiveApplication >> logout [

	self loginComponent
		ifNotNil: [ :component |
			component loggedOut ]
		ifNil: [
			self session ifNotNil: [ :value | value unregister ].
			self redirect ]
]

{ #category : #initialization }
MCWResponsiveApplication >> materialVersion100 [
	"Use 1.0.0 unpkg.com"

	self materialVersion: '1.0.0'
]

{ #category : #initialization }
MCWResponsiveApplication >> materialVersionDefault [

	self materialVersionLocalServer
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

{ #category : #testing }
MCWResponsiveApplication >> mcwIsResponsiveApplication [

	^ true
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

{ #category : #actions }
MCWResponsiveApplication >> redirectToLogin [

	| url |
	url := self application url.
	url addAllToPath: self requestContext consumer upToEnd.
	url addToPath: 'login'.
	^ self requestContext responseGenerator
		redirectTo: url;
		respond
]

{ #category : #rendering }
MCWResponsiveApplication >> renderContentOn: html [

	html document addLoadScript: (JSScript new add: (JSStream new nextPutAll: 'mdc.autoInit()'); yourself).
	self renderResizeScriptOn: html.
	self renderResizeOnloadScriptOn: html.

	self renderSetColorThemeOn: html.

	self renderSetGoogleFont: self settings mdcTypography on: html.

	self isLoggedIn
		ifTrue: [ self renderLayoutOn: html ]
		ifFalse: [
			self loginComponent
				ifNotNil: [ self renderLoginOn: html ]
				ifNil: [
					self anonymousLoginAllowed
						ifTrue: [ self renderLayoutOn: html ]
						ifFalse: [
							self loginComponent ifNil: [ self loginComponent: self buildLoginComponent ].
							self renderLoginOn: html ] ] ].

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
MCWResponsiveApplication >> renderResizeOnloadScriptOn: html [
	| sizeTestString |

	self isAutoResponsive ifFalse: [
		^ self ].

	sizeTestString := nil.
	self layout isPhoneStyle ifTrue: [
		sizeTestString := 'window.innerWidth >= 600' ].
	self layout isTabletStyle ifTrue: [
		sizeTestString := 'window.innerWidth < 600 || window.innerWidth >= 1240' ].
	self layout isLaptopStyle ifTrue: [
		sizeTestString := 'window.innerWidth < 1240 || window.innerWidth >= 1440' ].
	self layout isDesktopStyle ifTrue: [
		sizeTestString := 'window.innerWidth < 1440' ].

	sizeTestString ifNil: [
		^ self ].
	html document addLoadScript: (JSScript new add: (JSStream new nextPutAll: 'if (', sizeTestString, ') window.dispatchEvent(new Event(''resize''))'); yourself).
]

{ #category : #rendering }
MCWResponsiveApplication >> renderResizeScriptOn: html [

	self isAutoResponsive ifFalse: [
		^ self ].

	html html:
'<script>
window.addEventListener("resize", '
, (JSStream new argument:
	(html jQuery ajax
		callback: [ :value | self resizeString: value ] value: (JSStream on: '"[" + window.innerWidth + "," + window.innerHeight + "]"');
		onComplete: html javascript refresh) asFunction;
		yourself) contents, ')'
, '</script>'.

	false ifTrue: [
	html document addLoadScript: (JSStream new nextPutAll: 'window.addEventListener("resize", function(){alert("hhh")})').
	html document addLoadScript: (JSStream new nextPutAll: 'document.querySelector("body").onresize=function(){alert("ggg")}').
	]
]

{ #category : #rendering }
MCWResponsiveApplication >> renderSetColorThemeOn: html [
	| stream |

	stream := WriteStream on: String new.

	stream nextPutAll: 'var bodyStyle = document.querySelector(":root").style;'.
	self settings mdcTheme themeItems keysAndValuesDo: [ :eachKey :eachValue |
		stream
			nextPutAll: 'bodyStyle.setProperty("--mdc-theme-', eachKey, '", "#', eachValue asHexString, '");';
			yourself ].

	html script: stream contents.

]

{ #category : #rendering }
MCWResponsiveApplication >> renderSetGoogleFont: aFontSettings on: html [

	html script: 'document.querySelector("body").style.setProperty("--mdc-typography-font-family", "'
		, aFontSettings fontFamily, '")'
]

{ #category : #actions }
MCWResponsiveApplication >> resizeString: aString [
	"Change layout based on window width breakpoints:
		Extra-small (phone) 0-599
		Small (tablet) 600-904,905-1239
		Medium (laptop) 1240-1439
		Large (desktop) 1440+
	"
	| newSize newWidth newHeight |

	"Transcript crShow: aString."
	newSize := WAJsonParser parse: aString.
	newWidth := newSize first.
	newHeight := newSize second.

	newWidth < 600 ifTrue: [
		^ self beLayoutStructurePhone ].

	newWidth < 1240 ifTrue: [
		^ self beLayoutStructureTablet ].

	newWidth < 1440 ifTrue: [
		^ self beLayoutStructureLaptop ].

	self beLayoutStructureDesktop
]

{ #category : #initialization }
MCWResponsiveApplication >> rightNavDrawerId [

	^ 'rightNavDrawer'

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

{ #category : #accessing }
MCWResponsiveApplication >> snackbarText [

	^ snackbarText
]

{ #category : #accessing }
MCWResponsiveApplication >> snackbarText: anObject [

	snackbarText := anObject
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
		ifTrue: [ self layout topAppBar "short: false;" shortCollapsed: false ]
		ifFalse: [ self layout topAppBar "short: false; dense: false;" shortCollapsed: true ]

]

{ #category : #actions }
MCWResponsiveApplication >> toggleAutoResponsive [

	^ self settings toggleAutoResponsive
]

{ #category : #actions }
MCWResponsiveApplication >> toggleDenseView [

	^ self settings toggleDenseView
]

{ #category : #actions }
MCWResponsiveApplication >> toggleDismissibleDrawer [

	self layout sideNav dismissedToggle.
	"self layoutComponent adjustToolbarsPersistedSideNav: self sideNav isPersisted."

]

{ #category : #actions }
MCWResponsiveApplication >> toggleSideSheet [

	^ self layout sideSheet ifNotNil: [ :value |
		value toggleHiddenValue ]
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

	"anHtmlRoot bodyAttributes at: 'dir' append: 'rtl'."

	self bodyCssClasses do: [ :each | anHtmlRoot bodyAttributes addClass: each ]
]

{ #category : #updating }
MCWResponsiveApplication >> updateRootFonts: anHtmlRoot [
	| bugString |

	super updateRootFonts: anHtmlRoot.

	"fontNames := 'Roboto|Roboto+Condensed|Bree+Serif|Fontdiner+Swanky|Open+Sans|Oxygen+Mono|Pacifico'."
	"fontNames := '|' join: (self fonts collect: [:eachChoice | eachChoice googleFontsFamily])."

	"Patch for: https://github.com/material-components/material-components-web/issues/7264
	[MDC-Data-Table] thead > tr > th values are not bold as shown in the example"
	bugString := ':ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap'.

	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=', self settings mdcTypography fontFamily, bugString).
	self settings mdcTypography fontFamilies do: [ :eachFontFamily |
		anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=', eachFontFamily, bugString) ]
]
