Class {
	#name : #MCWDemoCatalogApp,
	#superclass : #MCWResponsiveApplication,
	#instVars : [
		'pageName'
	],
	#classInstVars : [
		'index',
		'listItem'
	],
	#category : #'Material-Web-Demo'
}

{ #category : #initialization }
MCWDemoCatalogApp class >> applicationPath [

	^'material/catalog'

]

{ #category : #initialization }
MCWDemoCatalogApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^self registerToDevelopment: self applicationPath

]

{ #category : #accessing }
MCWDemoCatalogApp >> appBarTitle [

	^'MDC Seaside'
]

{ #category : #accessing }
MCWDemoCatalogApp >> applicationTitle [

	^'Material Design Catalog'
]

{ #category : #initialization }
MCWDemoCatalogApp >> buildMainFab [

	^nil
]

{ #category : #initializing }
MCWDemoCatalogApp >> buildSideNavList [
	| navList |

	navList := MCWListBasic new.
	"navList addListItem: (MCWListItemIcon  itemText: 'Home' callback: [ self pageName: #home ]).
	self catalogList do: [:eachItem |
		navList addListItem: (MCWListItemIcon  itemText: eachItem second callback: [ self pageName: eachItem first asSymbol ])]"
]

{ #category : #'page - home' }
MCWDemoCatalogApp >> catalogList [

	^#(
('button' 'Button' 'buttons_180px.svg')
('card' 'Card' 'cards_180px.svg')
('checkbox' 'Checkbox' 'checkbox_180px.svg')
('chips' 'Chips' 'chips_180px.svg')
('data-table' 'Data Table' 'data_table_180px.svg')
('dialog' 'Dialog' 'dialog_180px.svg')
('drawer' 'Drawer' 'drawer_180px.svg')
('elevation' 'Elevation' 'elevation_180px.svg')
('fab' 'FAB' 'floating_action_button_180px.svg')
('icon-button' 'Icon Button' 'icon_button_180px.svg')
('image-list' 'Image List' 'image_list_180px.svg')
('layout-grid' 'Layout Grid' 'layout_grid_180px.svg')
('list' 'List' 'list_180px.svg')
('linear-progress-indicator' 'Linear Progress' 'linear_progress_180px.svg')
('menu' 'Menu' 'menu_180px.svg')
('radio' 'Radio' 'radio_180px.svg')
('ripple' 'Ripple' 'ripple_180px.svg')
('select' 'Select' 'form_field_180px.svg')
('slider' 'Slider' 'slider_180px.svg')
('snackbar' 'Snackbar' 'snackbar_180px.svg')
('switch' 'Switch' 'switch_180px.svg')
('tabs' 'Tab Bar' 'tabs_180px.svg')
('text-field' 'Text Field' 'form_field_180px.svg')
('theme' 'Theme' 'ic_theme_24px.svg')
('top-app-bar' 'Top App Bar' 'top_app_bar_180px.svg')
('typography' 'Typography' 'fonts_180px.svg')
)
]

{ #category : #initializing }
MCWDemoCatalogApp >> initialize [

	super initialize.

	self pageName: #home.

]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> isHomePage [

	^self pageName = #home
]

{ #category : #accessing }
MCWDemoCatalogApp >> pageName [
	^ pageName
]

{ #category : #accessing }
MCWDemoCatalogApp >> pageName: anObject [
	pageName := anObject
]

{ #category : #'page - button' }
MCWDemoCatalogApp >> renderCatalogButtonDemosOn: html [

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Text Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon']].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Raised Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon']].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Unelevated Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon']].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Outlined Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon']].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Shaped Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; class: 'demo-button-shaped'; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; class: 'demo-button-shaped'; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; class: 'demo-button-shaped'; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon']]
]

{ #category : #'page - button' }
MCWDemoCatalogApp >> renderCatalogButtonHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html button type: ''; class: 'hero-button'; mdcButton; mdcRippleUpgraded; with: 'Text'.
			html button type: ''; class: 'hero-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: 'Raised'.
			html button type: ''; class: 'hero-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: 'Unelevated'.
			html button type: ''; class: 'hero-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: 'Outlined'.
		]
	]

]

{ #category : #'page - button' }
MCWDemoCatalogApp >> renderCatalogButtonOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-buttons'
		'https://material.io/components/web/catalog/buttons/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-button'
	).
	headlineString := 'Button'.
	summaryString := 'Buttons communicate an action a user can take. They are typically placed throughout your UI, in places like dialogs, forms, cards, and toolbars.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderCatalogButtonHeroOn: html.
	self renderResources: resources on: html.
	self renderDemos: [ :value | self renderCatalogButtonDemosOn: value ] on: html
]

{ #category : #'page - data table' }
MCWDemoCatalogApp >> renderCatalogDatatableDemosOn: html [
	| dataHeadings dataRows |

	dataHeadings := { 'Dessert'->false. 'Carbs'->true. 'Protein (g)'->true. 'Comments'->false. }.
	dataRows := {
		{ 'Frozen yogurt'. '24'.'4.0'.'Super tasty' }.
		{ 'Ice cream sandwich'. '37'.'4.33333333333'.'I like ice cream more' }.
		{ 'Eclair'. '24'.'6.0'.'New filing flavor' }.
	 }.

	html break; break; break.
	html div mdcDataTable with: [
		html div mdcDataTable__tableContainer; with: [ 
			html table mdcDataTable__table; ariaLabel: 'Dessert calories'; with: [
				html tableHead with: [
					html tableRow "mdcDataTable__headerRow" with: [
						dataHeadings do: [ :each | | tag |
							tag := html tableHeading mdcDataTable__headerCell; mdcRole: 'columnHeader'; scope: 'col'; with: each key.
							each value ifTrue: [ tag  mdcDataTable__headerCell_numeric ] ] ]
					].
				html tableBody mdcDataTable__content; with: [
					dataRows do: [ :eachRow |
						html tableRow mdcDataTable__row; with: [
							eachRow doWithIndex: [ :each :index | | tag |
								tag := html tableData mdcDataTable__cell; scope: 'row'; with: each.
								(dataHeadings at: index) value ifTrue: [ tag  mdcDataTable__headerCell_numeric ] ] ] ] ] ] ] ]
]

{ #category : #'page - data table' }
MCWDemoCatalogApp >> renderCatalogDatatableHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]

]

{ #category : #'page - data table' }
MCWDemoCatalogApp >> renderCatalogDatatableOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-data-tables'
		'https://material.io/components/web/catalog/data-tables/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-data-table'
	).
	headlineString := 'Data Table'.
	summaryString := 'Data tables display information in a way that’s easy to scan, so that users can look for patterns and insights.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderCatalogDatatableHeroOn: html.
	self renderResources: resources on: html.
	self renderDemos: [ :value | self renderCatalogDatatableDemosOn: value ] on: html
]

{ #category : #'page - home' }
MCWDemoCatalogApp >> renderCatalogPage: aPageName on: html [
	| selector |

	selector := ('renderCatalog', self pageName asValidSelector capitalized, 'On:') asSymbol.

	(self respondsTo: selector)
		ifTrue: [^self perform: selector with: html].

	"html text: selector printString; break.
	html text: 'TODO: ', self pageName capitalized."

	html section class: 'hero'; with: [
		html heading level2; mdcTypography_headline1; with: self pageName capitalized, ' - To Do']
]

{ #category : #'page - home' }
MCWDemoCatalogApp >> renderCatalogPageListItem: anItem on: html [

	html listItem class: 'catalog-image-list-item'; mdcImageList__item;
		with: [
			html anchor class: 'catalog-image-link';
				callback: [self pageName: anItem first asSymbol];
				with: [
					html div class: 'catalog-image-list-item-container';
						mdcImageList__imageAspectContainer; mdcRippleSurface; mdcRippleUpgraded;
						with: [
							html div mdcImageList__image; with: [
								html image
									width: '100%';
									height: '100%';
									url: 'https://material-components.github.io/material-components-web-catalog/static/media/', anItem third]].
					html div mdcImageList__supporting; with: [
						html span class: 'catalog-image-list-label'; mdcImageList__label; with: anItem second]]]
]

{ #category : #'page - home' }
MCWDemoCatalogApp >> renderCatalogPageListOn: html [

	html unorderedList
		id: 'catalog-image-list';
		mdcImageList; class: 'standard-image-list'; mdcTopAppBar_fixedAdjust ;
		with: [
			self catalogList do: [:each |
				self renderCatalogPageListItem: each on: html]]
]

{ #category : #'page - select' }
MCWDemoCatalogApp >> renderCatalogSelectDemosOn: html [
	| selectedIndex |

	html break; break.
	selectedIndex := 2.
	html div
		mdcSelect; mdcAutoInit: 'MDCSelect';
		with: [
			html div
				mdcSelect__anchor;
				mdcRippleUpgraded;
				with: [
					html span mdcSelect__ripple.
					html span mdcSelect__dropdownIcon; style: 'background: url("data:image/svg+xml;charset=utf-8,%3Csvg width=''10'' height=''5'' viewBox=''7 10 10 5'' xmlns=''http://www.w3.org/2000/svg''%3E%3Cpath fill-rule=''evenodd'' opacity=''.54'' d=''M7 10l5 5 5-5z''/%3E%3C/svg%3E") no-repeat 50%';
						"style: 'left: auto; right: 8px; position: absolute; bottom: 8px;';"
						yourself.
					html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel'; with: 'Fruit'.
					html span mdcSelect__selectedTextContainer with: [ html span mdcSelect__selectedText; tabIndex: 0 ].
					html span mdcLineRipple ].
			html div mdcSelect__menu; mdcMenu; mdcMenuSurface; mdcAutoInit: 'MDCMenu'; with: [
				html unorderedList mdcList; with: [
					{ ''->''. 'apple'->'Apple'. 'orange'->'Orange'. 'banana'->'Banana' } doWithIndex: [ :item :index |
						| listItem isSelected |
						isSelected := index = selectedIndex.
						listItem := html listItem
							mdcListItem;
							ariaSelected: isSelected;
							mdcRole: 'option';
							dataValue: item key;
							with: [
								html span mdcListItem__ripple.
								html span mdcListItem__text; with: item value ].
						index = 1 ifTrue: [ listItem disabled ].
						listItem tabIndex: (index = 1 ifTrue: [0] ifFalse: [-1]).
						isSelected ifTrue: [ listItem mdcListItem_selected ]  ] ]
				 ] ]
		
]

{ #category : #'page - select' }
MCWDemoCatalogApp >> renderCatalogSelectHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]

]

{ #category : #'page - select' }
MCWDemoCatalogApp >> renderCatalogSelectOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-text-fields'
		'https://material.io/components/web/catalog/input-controls/select-menus/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-slider'
	).
	headlineString := 'Select'.
	summaryString := 'Selects allow users to select from a single-option menu. It functions as a wrapper around the browser''s native <select> element.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderCatalogSelectHeroOn: html.
	self renderResources: resources on: html.
	self renderDemos: [ :value | self renderCatalogSelectDemosOn: value ] on: html
]

{ #category : #'page - sliders' }
MCWDemoCatalogApp >> renderCatalogSliderDemosOn: html [

	html break; break; break.

	html div mdcSlider; mdcSlider_discrete; mdcAutoInit: 'MDCSlider'; style: 'width: 150px'; with: [
		html textInput mdcSlider__input; type: 'range'; name: 'volume';
			attributeAt: 'min' put: '0';
			attributeAt: 'max' put: '100';
			attributeAt: 'step' put: '10';
			ariaLabel: 'Discrete slider demo';
			value: '50'.
		html div mdcSlider__track; with: [
			html div mdcSlider__track_inactive.
			html div mdcSlider__track_active with: [
				html div mdcSlider__track_activefill ] ].
		html div mdcSlider__thumb; with: [
			html div mdcSlider__valueIndicatorContainer with: [
				html div mdcSlider__valueIndicator; with: [
					html span mdcSlider__valueIndicatorText; with: 50 ] ].
			html div mdcSlider__thumbKnob ] ]
]

{ #category : #'page - sliders' }
MCWDemoCatalogApp >> renderCatalogSliderHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]

]

{ #category : #'page - sliders' }
MCWDemoCatalogApp >> renderCatalogSliderOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-sliders'
		'https://material.io/components/web/catalog/input-controls/sliders/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-slider'
	).
	headlineString := 'Slider'.
	summaryString := 'Sliders let users select from a range of values by moving the slider thumb.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderCatalogSliderHeroOn: html.
	self renderResources: resources on: html.
	self renderDemos: [ :value | self renderCatalogSliderDemosOn: value ] on: html
		
]

{ #category : #'page - textfield' }
MCWDemoCatalogApp >> renderCatalogTextfieldDemosOn: html [
	| labelId |

	html break; break.
	labelId := html nextId.
	html label
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; "mdcFloatingLabel_floatAbove;" mdcAutoInit: 'MDCFloatingLabel';
				id: labelId;
				with: 'Label in correct place'.
			html textInput mdcTextField__input; ariaDescribedBy: labelId; yourself.
			html span mdcLineRipple ].
		
]

{ #category : #'page - textfield' }
MCWDemoCatalogApp >> renderCatalogTextfieldHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]

]

{ #category : #'page - textfield' }
MCWDemoCatalogApp >> renderCatalogTextfieldOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-text-fields'
		'https://material.io/components/web/catalog/input-controls/text-field/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-textfield'
	).
	headlineString := 'Text Field'.
	summaryString := 'Text fields allow users to input, edit, and select text.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderCatalogTextfieldHeroOn: html.
	self renderResources: resources on: html.
	self renderDemos: [ :value | self renderCatalogTextfieldDemosOn: value ] on: html
]

{ #category : #rendering }
MCWDemoCatalogApp >> renderContentOn: html [

	super renderContentOn: html
]

{ #category : #rendering }
MCWDemoCatalogApp >> renderCustomContentOn: html [
	"An earlier version of renderContentOn: that bypasses the inherited responsive application layout"

	html document addLoadScript: (JSScript new add: (JSStream new nextPutAll: 'mdc.autoInit()'); yourself).

	self renderRootOn: html.

	self renderMaterialComponentsWebJsOn: html.

]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderDemoContentOn: html [

	html div class: 'demo-content'; mdcDrawerAppContent; mdcTopAppBar_fixedAdjust; with: [
		html div class: 'demo-content-transition'; with: [
			html section class: 'loadComponent-enter-done'; with: [
				self renderCatalogPage: self pageName on: html]]]
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderDemoPanelOn: html [

	html div class: 'demo-panel'; with: [
		self renderDrawerOn: html.
		self renderDemoContentOn: html]
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderDemos: aBlock on: html [

	html heading level2; class: 'demo-title'; mdcTypography_headline6; with: 'Demos'.
	html div with: [ aBlock value: html ]
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderDrawerOn: html [

	html aside
		id: 'demo-drawer'; class: 'demo-drawer'; mdcDrawer; mdcTopAppBar_fixedAdjust; mdcAutoInit: 'MDCDrawer';
		"mdcDrawer_dismissible;"
		mdcDrawer_modal;
		with: [
			html div mdcDrawer__header; class: 'demo-drawer-header'; with: [
				html image
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg';
					class: 'resources-icon';
					altText: 'Material Design Guidelines icon'].
			html div mdcDrawer__content; with: [self renderNavOn: html]]
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderHeaderOn: html [

	html header
		class: 'catalog-top-app-bar';
		mdcTopAppBar;
		with: [
			self renderTopAppBarRowOn: html]
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderHeadline: aHeadline summary: aSummary on: html [

	html heading level1; mdcTypography_headline5; with: aHeadline.
	html paragraph mdcTypography_body1; with: aSummary

]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderHomePageOn: html [

	html div
		mdcTopAppBar_fixedAdjust;
		with: [ self renderCatalogPageListOn: html ]
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderMaterialLogoOn: html [

	html image
		url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_component_24px_white.svg';
		altText: 'Material logo'
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderMenuIconOn: html [

	html span mdcMaterialIcons; "altText: 'Menu button';" with: 'menu'
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderNavOn: html [

	html navigation mdcList; with: [

   		html anchor
				mdcRole: 'listitem';
				mdcListItem; mdcRippleUpgraded;
				tabIndex: -1;
				callback: [self pageName: #home];
				with: 'Home'.

		self catalogList do: [:eachItem |
			html anchor
				mdcRole: 'listitem';
				mdcListItem; mdcRippleUpgraded;
				tabIndex: -1;
				callback: [self pageName: eachItem first asSymbol];
				with: eachItem second].
	]
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderResources: resources on: html [

	html heading level6; class: 'demo-title'; mdcTypography_headline6; with: 'Resources'.
	html anchor
		url: resources first;
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Material Design Guidelines icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg'].
			html text: 'Material Design Guidelines'].
	html anchor
		url: resources second;
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Documentation icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_drive_document_24px.svg'].
			html text: 'Documentation'].
	html anchor
		url: resources third;
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Source Code icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_code_24px.svg'].
			html text: 'Source Code']
]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderRootOn: html [

	html div id: 'root'; with: [
		html div class: 'catalog-page-container'; with: [
			self renderHeaderOn: html.
			self isHomePage
				ifTrue: [self renderHomePageOn: html]
				ifFalse: [self renderDemoPanelOn: html]]]

]

{ #category : #'rendering - layout' }
MCWDemoCatalogApp >> renderTopAppBarRowOn: html [

	html div mdcTopAppBar__row; with: [
		html section mdcTopAppBar__section; mdcTopAppBar__section_alignStart; with: [
			html button
				mdcIconButton; mdcMaterialIcons;  mdcTopAppBar__navigationIcon; mdcRippleUpgraded; mdcRippleUpgraded_unbounded;
				title: 'Home';
				with: [
					self isHomePage
						ifTrue: [self renderMaterialLogoOn: html]
						ifFalse: [self renderMenuIconOn: html]].

			html span mdcTopAppBar__title; class: 'catalog-top-app-bar__title'; with: [
				html span class: 'catalog-top-app-bar__title--small-screen'; with: 'MDC Seaside'.
				html span class: 'catalog-top-app-bar__title--large-screen'; with: 'Material Components for Seaside']]]

]

{ #category : #updating }
MCWDemoCatalogApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	self updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #appCss).
	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #buttonCatalogCss).

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
