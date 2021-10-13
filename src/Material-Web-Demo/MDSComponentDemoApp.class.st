Class {
	#name : #MDSComponentDemoApp,
	#superclass : #MCWApplication,
	#instVars : [
		'topAppBar',
		'drawer',
		'list',
		'pages',
		'currentPage'
	],
	#category : #'Material-Web-Demo'
}

{ #category : #initialization }
MDSComponentDemoApp class >> applicationPath [

	^ 'material/component-demo'
]

{ #category : #accessing }
MDSComponentDemoApp class >> demoList [

	^ #(
('button' 'Button' 'buttons_180px.svg' MDSDemoButtonPage)
('card' 'Card' 'cards_180px.svg' MDSDemoCardPage)
('checkbox' 'Checkbox' 'checkbox_180px.svg' MDSDemoCheckboxPage)
('chips' 'Chips' 'chips_180px.svg' MDSDemoChipsPage)
('data-table' 'Data Table' 'data_table_180px.svg' MDSDemoDataTablePage)
('dialog' 'Dialog' 'dialog_180px.svg' MDSDemoDialogPage)
('drawer' 'Drawer' 'drawer_180px.svg' MDSDemoDrawerPage)
('elevation' 'Elevation' 'elevation_180px.svg' MDSDemoElevationPage)
('fab' 'FAB' 'floating_action_button_180px.svg' MDSDemoFABPage)
('icon-button' 'Icon Button' 'icon_button_180px.svg' MDSDemoIconButtonPage)
('image-list' 'Image List' 'image_list_180px.svg' MDSDemoImageListPage)
('layout-grid' 'Layout Grid' 'layout_grid_180px.svg' MDSDemoLayoutGridPage)
('linear-progress-indicator' 'Linear Progress' 'linear_progress_180px.svg' MDSDemoLinearProgressPage)
('list' 'List' 'list_180px.svg' MDSDemoListPage)
('menu' 'Menu' 'menu_180px.svg' MDSDemoMenuPage)
('radio' 'Radio' 'radio_180px.svg' MDSDemoRadioPage)
('ripple' 'Ripple' 'ripple_180px.svg' MDSDemoRipplePage)
('select' 'Select' 'form_field_180px.svg' MDSDemoSelectPage)
('slider' 'Slider' 'slider_180px.svg' MDSDemoSliderPage)
('snackbar' 'Snackbar' 'snackbar_180px.svg' MDSDemoSnackbarPage)
('switch' 'Switch' 'switch_180px.svg' MDSDemoSwitchPage)
('tabs' 'Tab Bar' 'tabs_180px.svg' MDSDemoTabBarPage)
('text-field' 'Text Field' 'form_field_180px.svg' MDSDemoTextFieldPage)
"('theme' 'Theme' 'ic_theme_24px.svg' MDSDemoThemePage)"
('top-app-bar' 'Top App Bar' 'top_app_bar_180px.svg' MDSDemoTopAppBarPage)
('typography' 'Typography' 'fonts_180px.svg' MDSDemoTypographyPage)
)
]

{ #category : #initialization }
MDSComponentDemoApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath
]

{ #category : #accessing }
MDSComponentDemoApp >> applicationTitle [

	^ 'Material Design Seaside'
]

{ #category : #initialization }
MDSComponentDemoApp >> buildDrawer [

	^ (MDSDrawer content: self list)
		fixedAdjustRegular;
		yourself
]

{ #category : #initialization }
MDSComponentDemoApp >> buildList [
	| newObject |

	newObject := MDSList new.
	newObject itemsAdd: (MDSListItem label: self homePageName callback: [ self currentPageSet: self homePageName ]).

	self class demoList do: [ :eachItem | | theLabel |
		theLabel := eachItem second.
		newObject itemsAdd: (MDSListItem label: theLabel callback: [ self currentPageSet: theLabel ]) ].
	
	^ newObject
]

{ #category : #initialization }
MDSComponentDemoApp >> buildPages [
	| newPages |

	newPages := Dictionary new.

	self class demoList do: [ :eachItem |
		newPages
			at: eachItem second
			put: (Smalltalk globals classNamed: eachItem fourth) ].

	^ newPages
]

{ #category : #initialization }
MDSComponentDemoApp >> buildTopAppBar [
	| widget |

	widget := MDSTopAppBar title: self applicationTitle.
	"widget middleSection: self tabs."

	^ widget
]

{ #category : #accessing }
MDSComponentDemoApp >> currentPage [

	^ currentPage
]

{ #category : #accessing }
MDSComponentDemoApp >> currentPage: anObject [

	currentPage := anObject
]

{ #category : #accessing }
MDSComponentDemoApp >> currentPageSet: anObject [

	self currentPage: anObject.
	self list do: [ :eachItem | eachItem active: (eachItem label = anObject) ]
]

{ #category : #accessing }
MDSComponentDemoApp >> drawer [

	^ drawer
]

{ #category : #accessing }
MDSComponentDemoApp >> drawer: anObject [

	drawer := anObject
]

{ #category : #accessing }
MDSComponentDemoApp >> homePageName [

	^ 'Home'
]

{ #category : #initialization }
MDSComponentDemoApp >> initialize [

	super initialize.

	self currentPage: self homePageName.
	self pages: self buildPages.
	self topAppBar: self buildTopAppBar.
	self list: self buildList.
	self drawer: self buildDrawer
]

{ #category : #accessing }
MDSComponentDemoApp >> list [

	^ list
]

{ #category : #accessing }
MDSComponentDemoApp >> list: anObject [

	list := anObject
]

{ #category : #accessing }
MDSComponentDemoApp >> pages [

	^ pages
]

{ #category : #accessing }
MDSComponentDemoApp >> pages: anObject [

	pages := anObject
]

{ #category : #rendering }
MDSComponentDemoApp >> renderCatalogPageListItem: anItem on: html [

	html listItem class: 'catalog-image-list-item'; mdcImageList__item;
		with: [
			html anchor class: 'catalog-image-link';
				callback: [ self currentPageSet: anItem second ];
				with: [
					html div class: 'catalog-image-list-item-container';
						mdcImageList__imageAspectContainer; mdcRippleSurface; mdcRippleUpgraded;
						with: [
							html div mdcImageList__image; with: [
								html image
									width: '100%';
									height: '100%';
									url: 'https://material-components.github.io/material-components-web-catalog/static/media/', anItem third ] ].
					html div mdcImageList__supporting; with: [
						html span class: 'catalog-image-list-label'; mdcImageList__label; with: anItem second ] ] ]
]

{ #category : #rendering }
MDSComponentDemoApp >> renderContentAreaOn: html [

	self renderCurrentDisplayOn: html
]

{ #category : #rendering }
MDSComponentDemoApp >> renderContentOn: html [

	html document addLoadScript: (JSStream on: 'mdc.autoInit()').

	html script with:
		'var bodyStyle = document.querySelector("body").style;'
		, 'bodyStyle.setProperty("--mdc-theme-primary", "#0088F0");'.

	self renderLayoutOn: html.

	self renderMaterialComponentsWebJsOn: html
]

{ #category : #rendering }
MDSComponentDemoApp >> renderCurrentDisplayOn: html [
	| pageClass |

	self currentPage = self homePageName ifTrue: [
		^ self renderHomePageOn: html ].

	pageClass := self pages at: self currentPage ifAbsent: [ nil ].

	pageClass ifNil: [
		^ html text: self currentPage asString, ' - Unknown' ].

	html div
		style: 'width: 800px; margin: 20px auto';
		with: [ html render: pageClass new ]
]

{ #category : #rendering }
MDSComponentDemoApp >> renderHomePageOn: html [

	html unorderedList
		id: 'catalog-image-list';
		mdcImageList; class: 'standard-image-list';
		with: [
			self class demoList do: [ :each |
				self renderCatalogPageListItem: each on: html ] ]
]

{ #category : #rendering }
MDSComponentDemoApp >> renderLayoutOn: html [

	html render: self buildTopAppBar.

	html div style: 'height: 100vh'; with: self drawer.
	"html render: self drawer."

	html div mdcDrawerAppContent; style: 'width: 800px'; with: [
		html div mdcTopAppBar_fixedAdjust.
		self renderContentAreaOn: html ]
]

{ #category : #accessing }
MDSComponentDemoApp >> topAppBar [

	^ topAppBar
]

{ #category : #accessing }
MDSComponentDemoApp >> topAppBar: anObject [

	topAppBar := anObject
]

{ #category : #updating }
MDSComponentDemoApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot link relationship: 'dns-prefetch'; url: '//fonts.googleapis.com'.
	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/css2?family=Material+Icons'.
	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/css2?family=Material+Icons+Outlined'.
	anHtmlRoot stylesheet url: MCWResponsiveAppLibrary / #responsiveAppCss.

	anHtmlRoot stylesheet url: (MDSComponentDemoLibrary urlOf: #appCss).
	anHtmlRoot stylesheet url: (MDSComponentDemoLibrary urlOf: #buttonCatalogCss).

	anHtmlRoot title: self applicationTitle.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		attributeAt: 'content' put: 'width=device-width, initial-scale=1'.

	anHtmlRoot bodyAttributes addClass: 'mcw-body'.
	anHtmlRoot bodyAttributes addClass: 'mdc-typography'
]
