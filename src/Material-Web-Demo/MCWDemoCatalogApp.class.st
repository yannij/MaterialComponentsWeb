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
	#category : 'Material-Web-Demo'
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
MCWDemoCatalogApp >> applicationTitle [

	^'Material Design Catalog'
]

{ #category : #initializing }
MCWDemoCatalogApp >> buildSideNavList [

	^MCWListGroup new
		addGroupedList: (MCWListBasic new
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 1' iconName: 'assignment' callback: [self sideNav menuItemCallback]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 2' iconName: 'bug_report' callback: [self sideNav menuItemCallback]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 3' iconName: 'build' callback: [self sideNav menuItemCallback]);
			addListItem: (MCWListItemIcon  itemText: 'Nav Item 4' iconName: 'delete' callback: [self sideNav menuItemCallback]);
			yourself);
		yourself

]

{ #category : #accessing }
MCWDemoCatalogApp >> catalogList [

	^#(
('button' 'Button' 'buttons_180px.svg')
('card' 'Card' 'cards_180px.svg')
('checkbox' 'Checkbox' 'checkbox_180px.svg')
('chips' 'Chips' 'chips_180px.svg')
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

{ #category : #testing }
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
MCWDemoCatalogApp >> renderButtonDemoContentOn: html [

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
MCWDemoCatalogApp >> renderButtonDemoOn: html [

	html heading level2; class: 'demo-title'; mdcTypography_headline6; with: 'Demos'.

	html div with: [
		self renderButtonDemoContentOn: html]
]

{ #category : #'page - button' }
MCWDemoCatalogApp >> renderButtonHeroOn: html [

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
MCWDemoCatalogApp >> renderButtonSummaryOn: html [

	html heading level1; mdcTypography_headline5; with: 'Button'.

	html paragraph
		mdcTypography_body1;
		with: 'Buttons communicate an action a user can take. They are typically placed throughout your UI, in places like dialogs, forms, cards, and toolbars.'

]

{ #category : #'rendering - landing page' }
MCWDemoCatalogApp >> renderCatalogListItem: anItem on: html [

	html listItem
		class: 'catalog-image-list-item';
		mdcImageList__item;
		with: [
			html anchor
				class: 'catalog-image-link';
				callback: [self pageName: anItem first asSymbol];
				with: [
					html div
						class: 'catalog-image-list-item-container';
						mdcImageList__imageAspectContainer; mdcRippleSurface; mdcRippleUpgraded;
						with: [
							html div mdcImageList__image; with: [
								html image
									width: '100%';
									height: '100%';
									url: 'https://material-components.github.io/material-components-web-catalog/static/media/', anItem third]].
					html div
						mdcImageList__supporting;
						with: [html span class: 'catalog-image-list-label'; mdcImageList__label; with: anItem second]]]
]

{ #category : #'rendering - landing page' }
MCWDemoCatalogApp >> renderCatalogListOn: html [

	html unorderedList
		id: 'catalog-image-list';
		mdcImageList;
		class: 'standard-image-list';
		with: [
			self catalogList do: [:each |
				self renderCatalogListItem: each on: html]]
]

{ #category : #'rendering - catalog page' }
MCWDemoCatalogApp >> renderCatalogPage: aPageName on: html [
	| selector |

	selector := ('renderCatalogPage', self pageName asValidSelector capitalized, 'On:') asSymbol.

	(self respondsTo: selector)
		ifTrue: [^self perform: selector with: html].

	"html text: selector printString; break.
	html text: 'TODO: ', self pageName capitalized."

	html section class: 'hero'; with: [
		html heading level2; mdcTypography_headline1; with: self pageName capitalized, ' - To Do']
]

{ #category : #'page - button' }
MCWDemoCatalogApp >> renderCatalogPageButtonOn: html [

	self renderButtonSummaryOn: html.
	self renderButtonHeroOn: html.
	self renderResources: self resourcesDataButton on: html.
	self renderButtonDemoOn: html
]

{ #category : #'page - textfield' }
MCWDemoCatalogApp >> renderCatalogPageSelectOn: html [
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

{ #category : #'page - textfield' }
MCWDemoCatalogApp >> renderCatalogPageTextfieldOn: html [
	| labelId |

	html break; break; break; yourself.

	html break; break; html: '<label class="mdc-text-field mdc-text-field--filled mdc-text-field--label-floating">
  <span class="mdc-text-field__ripple"></span>
  <span class="mdc-floating-label mdc-floating-label--float-above" id="my-label-id">
    Label in correct place
  </span>
  <input class="mdc-text-field__input" type="text" aria-labelledby="my-label-id" value="Pre-filled value">
  <span class="mdc-line-ripple"></span>
</label>'.
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
MCWDemoCatalogApp >> renderCatalogPageTextfieldOnFromDocs: html [

	html break; break; break; yourself.

	html html: '<label class="mdc-text-field mdc-text-field--filled">
  <span class="mdc-text-field__ripple"></span>
  <span class="mdc-floating-label" id="my-label-id">Hint text</span>
  <input class="mdc-text-field__input" type="text" aria-labelledby="my-label-id">
  <span class="mdc-line-ripple"></span>
</label>'.

	html break; break; html: '<label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label">
  <span class="mdc-text-field__ripple"></span>
  <input class="mdc-text-field__input" type="text" placeholder="Placeholder text" aria-label="Label">
  <span class="mdc-line-ripple"></span>
</label>'.

	html break; break; html: '<label class="mdc-text-field mdc-text-field--filled mdc-text-field--label-floating">
  <span class="mdc-text-field__ripple"></span>
  <span class="mdc-floating-label mdc-floating-label--float-above" id="my-label-id">
    Label in correct place
  </span>
  <input class="mdc-text-field__input" type="text" aria-labelledby="my-label-id" value="Pre-filled value">
  <span class="mdc-line-ripple"></span>
</label>'
]

{ #category : #'page - textfield' }
MCWDemoCatalogApp >> renderCatalogPageTextfieldOnOrig: html [

	html break; break; break; yourself.

	html html: '<div class="text-field-container">

<div class="mdc-text-field text-field mdc-ripple-upgraded" style="--mdc-ripple-fg-size:144px; --mdc-ripple-fg-scale:1.78088; --mdc-ripple-fg-translate-start:48.5864px, -46.3951px; --mdc-ripple-fg-translate-end:48px, -44px;">
        <input type="text" id="text-field-filled" class="mdc-text-field__input" aria-describedby="text-field-filled-helper-text">
        <label class="mdc-floating-label" for="text-field-filled">Standard
        </label>
        <div class="mdc-line-ripple" style="transform-origin: 120.5px center;">
        </div>  
</div>  
<div class="mdc-text-field-helper-line">
        <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg" id="text-field-filled-helper-text">Helper Text
        </p>    
</div>  
'
]

{ #category : #'page - textfield' }
MCWDemoCatalogApp >> renderCatalogPageTextfieldOnOrigSeaside: html [

	html break; break; break; yourself.

	html div
		mdcAutoInit: 'MDCTextField';
		mdcTextField;
		mdcRippleUpgraded;
		style: '--mdc-ripple-fg-size:144px; --mdc-ripple-fg-scale:1.78088; --mdc-ripple-fg-translate-start:48.5864px, -46.3951px; --mdc-ripple-fg-translate-end:48px, -44px;';
		with: [
			html textInput
				id: 'text-field-filled2';
				mdcTextField__input;
				ariaDescribedBy: 'text-field-filled-helper-text';
				yourself.
			html label
				mdcFloatingLabel;
				mdcFloatingLabel_floatAbove;
				for: 'text-field-filled2';
				with: 'Standard'.
			html div mdcLineRipple; style: 'transform-origin: 120.5px center;'; yourself ].
	html div
		mdcTextFieldHelperLine;
		with: [
			html paragraph
				id: 'text-field-filled-helper-text';
				mdcTextFieldHelperText;
				mdcTextFieldHelperText_persistent;
				mdcTextFieldHelperText_validationMsg;
				with: 'Helper Text'
		].
	html div onLoad: 'mdc.textField.MDCTextField.attachTo(document.querySelector(''.mdc-text-field''))'
]

{ #category : #rendering }
MCWDemoCatalogApp >> renderContentOn: html [

	html document addLoadScript: (JSScript new add: (JSStream new nextPutAll: 'mdc.autoInit()')).

	self renderRootOn: html.

	self renderMaterialComponentsWebJsOn: html.

]

{ #category : #'rendering - catalog page' }
MCWDemoCatalogApp >> renderDemoContentOn: html [

	html div class: 'demo-content'; mdcDrawerAppContent; mdcTopAppBar_fixedAdjust; with: [
		html div class: 'demo-content-transition'; with: [
			html section class: 'loadComponent-enter-done'; with: [
				self renderCatalogPage: self pageName on: html]]]
]

{ #category : #'rendering - catalog page' }
MCWDemoCatalogApp >> renderDemoPanelOn: html [

	html div class: 'demo-panel'; with: [
		self renderDrawerOn: html.
		self renderDemoContentOn: html]
]

{ #category : #'rendering - catalog page' }
MCWDemoCatalogApp >> renderDrawerOn: html [

	html aside id: 'demo-drawer'; mdcDrawer; mdcDrawer_dismissible; class: 'demo-drawer'; mdcTopAppBar_fixedAdjust; with: [
		html div mdcDrawer__header; class: 'demo-drawer-header'; with: [
			html image
				url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg';
				class: 'resources-icon';
				altText: 'Material Design Guidelines icon'].
		html div mdcDrawer__content; with: [
			self renderNavOn: html]]
]

{ #category : #rendering }
MCWDemoCatalogApp >> renderHeaderOn: html [

	html header mdcTopAppBar; class: 'catalog-top-app-bar'; with: [
		self renderTopAppBarRowOn: html]
]

{ #category : #'rendering - landing page' }
MCWDemoCatalogApp >> renderLandingPageOn: html [

	html div
		mdcTopAppBar_fixedAdjust;
		with: [ self renderCatalogListOn: html ]
]

{ #category : #rendering }
MCWDemoCatalogApp >> renderMaterialLogoOn: html [

	html image
		url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_component_24px_white.svg';
		altText: 'Material logo'
]

{ #category : #rendering }
MCWDemoCatalogApp >> renderMenuIconOn: html [

	html span mdcMaterialIcons; "altText: 'Menu button';" with: 'menu'
]

{ #category : #'rendering - catalog page' }
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

{ #category : #'page - button' }
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

{ #category : #rendering }
MCWDemoCatalogApp >> renderRootOn: html [

	html div id: 'root'; with: [
		html div class: 'catalog-page-container'; with: [
			self renderHeaderOn: html.
			self isHomePage
				ifTrue: [self renderLandingPageOn: html]
				ifFalse: [self renderDemoPanelOn: html]]]

]

{ #category : #rendering }
MCWDemoCatalogApp >> renderTopAppBarRowOn: html [

	html div mdcTopAppBar__row; with: [
		html section mdcTopAppBar__section; mdcTopAppBar__section_alignStart; with: [
			html button
				mdcMaterialIcons; mdcTopAppBar__navigationIcon; mdcRippleUpgraded; mdcRippleUpgraded_unbounded;
				title: 'Home';
				with: [
					self isHomePage
						ifTrue: [self renderMaterialLogoOn: html]
						ifFalse: [self renderMenuIconOn: html]].

			html span mdcTopAppBar__title; class: 'catalog-top-app-bar__title'; with: [
				html span class: 'catalog-top-app-bar__title--small-screen'; with: 'MDC Web'.
				html span class: 'catalog-top-app-bar__title--large-screen'; with: 'Material Components for the Web']]]

]

{ #category : #'page - button' }
MCWDemoCatalogApp >> resourcesDataButton [

	^#(
	'https://material.io/go/design-buttons'
	'https://material.io/components/web/catalog/buttons/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-button'
	)
]

{ #category : #updating }
MCWDemoCatalogApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	self updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #appCss).
	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #buttonCatalogCss).

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
