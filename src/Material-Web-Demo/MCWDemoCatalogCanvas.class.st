Class {
	#name : #MCWDemoCatalogCanvas,
	#superclass : #MCWLayoutComponent,
	#instVars : [
		'pageName'
	],
	#category : #'Material-Web-Demo'
}

{ #category : #'page - home' }
MCWDemoCatalogCanvas >> catalogList [

	^ #(
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

{ #category : #'page - dialog' }
MCWDemoCatalogCanvas >> dialogOpenScript: anHtmlId [

	^ 'document.getElementById(''', anHtmlId, ''').MDCDialog.open()'
]

{ #category : #initialization }
MCWDemoCatalogCanvas >> initialize [

	super initialize.

	self pageName: #home.

]

{ #category : #accessing }
MCWDemoCatalogCanvas >> pageName [
	^ pageName
]

{ #category : #accessing }
MCWDemoCatalogCanvas >> pageName: anObject [
	pageName := anObject
]

{ #category : #'page - button' }
MCWDemoCatalogCanvas >> renderCatalogButtonDemosOn: html [

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Text Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Raised Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Unelevated Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Outlined Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Shaped Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; class: 'demo-button-shaped'; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; class: 'demo-button-shaped'; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; class: 'demo-button-shaped'; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ]
]

{ #category : #'page - button' }
MCWDemoCatalogCanvas >> renderCatalogButtonHeroOn: html [

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
MCWDemoCatalogCanvas >> renderCatalogButtonOn: html [
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
MCWDemoCatalogCanvas >> renderCatalogDatatableDemosOn: html [
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
							eachRow keysAndValuesDo: [ :index :each | | tag |
								tag := html tableData mdcDataTable__cell; scope: 'row'; with: each.
								(dataHeadings at: index) value ifTrue: [ tag  mdcDataTable__headerCell_numeric ] ] ] ] ] ] ] ]
]

{ #category : #'page - data table' }
MCWDemoCatalogCanvas >> renderCatalogDatatableHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]

]

{ #category : #'page - data table' }
MCWDemoCatalogCanvas >> renderCatalogDatatableOn: html [
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

{ #category : #'page - dialog' }
MCWDemoCatalogCanvas >> renderCatalogDialogOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-dialogs'
		'https://material.io/components/web/catalog/dialogs/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-dialog'
	).
	headlineString := 'Dialog'.
	summaryString := 'Dialogs inform users about a specific task and may contain critical information, require decisions, or involve multiple tasks.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderDialogHeroOn: html.
	self renderResources: resources on: html.
	self renderDemos: [ :value | self renderDialogDemosOn: value ] on: html
]

{ #category : #'page - home' }
MCWDemoCatalogCanvas >> renderCatalogHomeOn: html [

	self renderCatalogPageListOn: html
]

{ #category : #'page - home' }
MCWDemoCatalogCanvas >> renderCatalogPage: aPageName on: html [
	| selector |

	selector := ('renderCatalog', self pageName asValidSelector capitalized, 'On:') asSymbol.

	(self respondsTo: selector)
		ifTrue: [ ^ self perform: selector with: html ].

	"html text: selector printString; break.
	html text: 'TODO: ', self pageName capitalized."

	html section class: 'hero'; with: [
		html heading level2; mdcTypography_headline1; with: self pageName capitalized, ' - To Do' ]
]

{ #category : #'page - home' }
MCWDemoCatalogCanvas >> renderCatalogPageListItem: anItem on: html [

	html listItem class: 'catalog-image-list-item'; mdcImageList__item;
		with: [
			html anchor class: 'catalog-image-link';
				callback: [ self pageName: anItem first asSymbol ];
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

{ #category : #'page - home' }
MCWDemoCatalogCanvas >> renderCatalogPageListOn: html [

	html unorderedList
		id: 'catalog-image-list';
		mdcImageList; class: 'standard-image-list'; mdcTopAppBar_fixedAdjust;
		with: [
			self catalogList do: [ :each |
				self renderCatalogPageListItem: each on: html ] ]
]

{ #category : #'page - radio' }
MCWDemoCatalogCanvas >> renderCatalogRadioDemosOn: html [

	html text: 'todo'
]

{ #category : #'page - radio' }
MCWDemoCatalogCanvas >> renderCatalogRadioExampleOn: html [

	html div mdcFormField; style: 'width: 100px'; mdcAutoInit: 'MDCFormField'; with: [
		html div mdcRadio; mdcAutoInit: 'MDCRadio'; with: [
			html textInput mdcRadio__nativeControl; type: 'radio'; id: 'radio1'; name: 'radios'.
			html div mdcRadio__background; with: [
				html div mdcRadio__outerCircle.
				html div mdcRadio__innerCircle ].
			html div mdcRadio__ripple ].
		html label for: 'radio1'; with: 'Radio 1' ].
	html div mdcFormField; style: 'width: 100px'; mdcAutoInit: 'MDCFormField'; with: [
		html div mdcRadio; mdcAutoInit: 'MDCRadio'; with: [
			html textInput mdcRadio__nativeControl; type: 'radio'; id: 'radio2'; name: 'radios'.
			html div mdcRadio__background; with: [
				html div mdcRadio__outerCircle.
				html div mdcRadio__innerCircle ].
			html div mdcRadio__ripple ].
		html label for: 'radio2'; with: 'Radio 2' ]
]

{ #category : #'page - radio' }
MCWDemoCatalogCanvas >> renderCatalogRadioHeroOn: html [

	html div class: 'hero'; with: [
		self renderCatalogRadioExampleOn: html ]
]

{ #category : #'page - radio' }
MCWDemoCatalogCanvas >> renderCatalogRadioOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-radio-buttons'
		'https://material.io/components/web/catalog/input-controls/radio-buttons/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-radio'
	).
	headlineString := 'Radio Buttons'.
	summaryString := 'Buttons communicate an action a user can take. They are typically placed throughout your UI, in places like dialogs, forms, cards, and toolbars.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderCatalogRadioHeroOn: html.
	self renderResources: resources on: html.
	self renderDemos: [ :value | self renderCatalogRadioDemosOn: value ] on: html
]

{ #category : #'page - select' }
MCWDemoCatalogCanvas >> renderCatalogSelectDemosOn: html [
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
					{ ''->''. 'apple'->'Apple'. 'orange'->'Orange'. 'banana'->'Banana' } keysAndValuesDo: [ :index :item |
						| listItem isSelected |
						isSelected := index = selectedIndex.
						listItem := html listItem
							mdcListItem;
							ariaSelected: isSelected;
							mdcRole: 'option';
							dataValue: item key;
							with: [
								html span mdcListItem__ripple.
								html span mdcDeprecatedListItem__text; with: item value ].
						index = 1 ifTrue: [ listItem disabled ].
						listItem tabIndex: (index = 1 ifTrue: [ 0 ] ifFalse: [ -1 ]).
						isSelected ifTrue: [ listItem mdcListItem_selected ]  ] ]
				 ] ]
		
]

{ #category : #'page - select' }
MCWDemoCatalogCanvas >> renderCatalogSelectHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]

]

{ #category : #'page - select' }
MCWDemoCatalogCanvas >> renderCatalogSelectOn: html [
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
MCWDemoCatalogCanvas >> renderCatalogSliderDemosOn: html [

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
MCWDemoCatalogCanvas >> renderCatalogSliderHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]

]

{ #category : #'page - sliders' }
MCWDemoCatalogCanvas >> renderCatalogSliderOn: html [
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
MCWDemoCatalogCanvas >> renderCatalogTextfieldDemosOn: html [
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
MCWDemoCatalogCanvas >> renderCatalogTextfieldHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]

]

{ #category : #'page - textfield' }
MCWDemoCatalogCanvas >> renderCatalogTextfieldOn: html [
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
MCWDemoCatalogCanvas >> renderContentOn: html [

	self renderCatalogPage: self pageName on: html
]

{ #category : #'utility - page' }
MCWDemoCatalogCanvas >> renderDemos: aBlock on: html [

	html heading level2; class: 'demo-title'; mdcTypography_headline6; with: 'Demos'.
	html div with: [ aBlock value: html ]
]

{ #category : #'page - dialog' }
MCWDemoCatalogCanvas >> renderDialogAlertOn: html [
	| dialogId |

	dialogId := html nextId.
	html div mdcDialog; "mdcDialog_open;" id: dialogId; mdcRole: 'alertdialog'; mdcAutoInit: 'MDCDialog'; with: [
		html div mdcDialog__scrim.
		html div mdcDialog__container; with: [
			html div mdcDialog__surface; with: [
				html section mdcDialog__content; with: [
					html paragraph: 'Discard draft?' ].
				html footer mdcDialog__actions; with: [
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded;
						attributeAt: 'data-mdc-dialog-action' put: 'cancel';
						with: 'Cancel'.
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded;
						attributeAt: 'data-mdc-dialog-action' put: 'discard';
						with: 'Dicard' ] ] ] ].

	^ dialogId
]

{ #category : #'page - dialog' }
MCWDemoCatalogCanvas >> renderDialogConfirmationOn: html [
	| dialogId data |

	data := #(
(0 'test-dialog-baseline-confirmation-radio-1' 'Never Gonna Give You Up')
(-1 'test-dialog-baseline-confirmation-radio-2' 'Hot Cross Buns')
(-1 'test-dialog-baseline-confirmation-radio-3' 'None')
).

	dialogId := html nextId.
	html div mdcDialog; id: dialogId; mdcRole: 'alertdialog'; mdcAutoInit: 'MDCDialog'; with: [
		html div mdcDialog__scrim.
		html div mdcDialog__container; with: [
			html div mdcDialog__surface; with: [
				html heading level2; mdcDialog__title; with: 'Phone ringtone'.
				html section mdcDialog__content; with: [
					html unorderedList mdcList; mdcList_avatarList; style: 'list-style-typ: none'; with: [
						data do: [ :eachItem |
						html listItem mdcListItem; tabIndex: 0; with: [
							html span mdcDeprecatedListItem__graphic; with: [
								html div mdcRadio with: [
									html radioButton mdcRadio__nativeControl
										id: eachItem second;
										name: 'test-dialog-baseline-confirmation-radio-group';
										with: [
											html div mdcRadio__background; with: [
												html div mdcRadio__outerCircle.
												html div mdcRadio__innerCircle ] ] ] ].
							html label for: eachItem second; with: eachItem third ] ] ] ].
				html footer mdcDialog__actions; with: [
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded;
						attributeAt: 'data-mdc-dialog-action' put: 'close';
						with: 'Cancel'.
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded; style: 'mdc-dialog__button--default';
						attributeAt: 'data-mdc-dialog-action' put: 'accept';
						with: 'OK' ] ] ] ].

	^ dialogId
]

{ #category : #'page - dialog' }
MCWDemoCatalogCanvas >> renderDialogDemosOn: html [
	| alertId simpleId confirmationId scrollableId |

	alertId := self renderDialogAlertOn: html.
	simpleId := self renderDialogSimpleOn: html.
	confirmationId := self renderDialogConfirmationOn: html.
	scrollableId := self renderDialogScrollableOn: html.

	html button mdcButton; onClick: (self dialogOpenScript: alertId); with: 'Alert'.
	html button mdcButton; onClick: (self dialogOpenScript: simpleId); with: 'Simple'.
	html button mdcButton; onClick: (self dialogOpenScript: confirmationId); with: 'Confirmation'.
	html button mdcButton; onClick: (self dialogOpenScript: scrollableId); with: 'Scrollable'.
	html break; break; break; break
]

{ #category : #'page - dialog' }
MCWDemoCatalogCanvas >> renderDialogHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html html: '<div id="my-mdc-dialog" class="mdc-dialog hero-demo" role="alertdialog" aria-labelledby="my-mdc-dialog-label" aria-describedby="my-mdc-dialog-description"><div class="mdc-dialog__container"><div class="mdc-dialog__surface"><h2 id="my-mdc-dialog-label" class="mdc-dialog__title">Get this party started?</h2><section id="my-mdc-dialog-description" class="mdc-dialog__content">Turn up the jams and have a good time.</section><footer class="mdc-dialog__actions"><button type="button" class="mdc-button mdc-dialog__button mdc-ripple-upgraded">Decline</button><button type="button" class="mdc-button mdc-dialog__button mdc-ripple-upgraded">Accept</button></footer></div></div></div>'
		] ]
]

{ #category : #'page - dialog' }
MCWDemoCatalogCanvas >> renderDialogScrollableOn: html [
	| dialogId |

	dialogId := html nextId.
	html div mdcDialog; mdcDialog_scrollable; id: dialogId; mdcRole: 'alertdialog'; mdcAutoInit: 'MDCDialog'; with: [
		html div mdcDialog__scrim.
		html div mdcDialog__container; with: [
			html div mdcDialog__surface; with: [
				html heading level2; mdcDialog__title; with: 'The Wonderful Wizard of Oz'.
				self renderDialogScrollableSectionOn: html.
				html footer mdcDialog__actions; with: [
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded;
						attributeAt: 'data-mdc-dialog-action' put: 'close';
						with: 'Cancel'.
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded; style: 'mdc-dialog__button--default';
						attributeAt: 'data-mdc-dialog-action' put: 'accept';
						with: 'OK' ] ] ] ].

	^ dialogId
]

{ #category : #'page - dialog' }
MCWDemoCatalogCanvas >> renderDialogScrollableSectionOn: html [
	| paragraphs |

	paragraphs := #(
'Dorothy lived in the midst of the great Kansas prairies, with Uncle Henry, who was a farmer, and Aunt Em, who was the farmer''s wife. Their house was small, for the lumber to build it had to be carried by wagon many miles. There were four walls, a floor and a roof, which made one room; and this room contained a rusty looking cookstove, a cupboard for the dishes, a table, three or four chairs, and the beds. Uncle Henry and Aunt Em had a big bed in one corner, and Dorothy a little bed in another corner. There was no garret at all, and no cellar--except a small hole dug in the ground, called a cyclone cellar, where the family could go in case one of those great whirlwinds arose, mighty enough to crush any building in its path. It was reached by a trap door in the middle of the floor, from which a ladder led down into the small, dark hole.'
'When Dorothy stood in the doorway and looked around, she could see nothing but the great gray prairie on every side. Not a tree nor a house broke the broad sweep of flat country that reached to the edge of the sky in all directions. The sun had baked the plowed land into a gray mass, with little cracks running through it. Even the grass was not green, for the sun had burned the tops of the long blades until they were the same gray color to be seen everywhere. Once the house had been painted, but the sun blistered the paint and the rains washed it away, and now the house was as dull and gray as everything else.'
'When Aunt Em came there to live she was a young, pretty wife. The sun and wind had changed her, too. They had taken the sparkle from her eyes and left them a sober gray; they had taken the red from her cheeks and lips, and they were gray also. She was thin and gaunt, and never smiled now. When Dorothy, who was an orphan, first came to her, Aunt Em had been so startled by the child''s laughter that she would scream and press her hand upon her heart whenever Dorothy''s merry voice reached her ears; and she still looked at the little girl with wonder that she could find anything to laugh at.'
'Uncle Henry never laughed. He worked hard from morning till night and did not know what joy was. He was gray also, from his long beard to his rough boots, and he looked stern and solemn, and rarely spoke.'
'It was Toto that made Dorothy laugh, and saved her from growing as gray as her other surroundings. Toto was not gray; he was a little black dog, with long silky hair and small black eyes that twinkled merrily on either side of his funny, wee nose. Toto played all day long, and Dorothy played with him, and loved him dearly.'
'Today, however, they were not playing. Uncle Henry sat upon the doorstep and looked anxiously at the sky, which was even grayer than usual. Dorothy stood in the door with Toto in her arms, and looked at the sky too. Aunt Em was washing the dishes.'
'From the far north they heard a low wail of the wind, and Uncle Henry and Dorothy could see where the long grass bowed in waves before the coming storm. There now came a sharp whistling in the air from the south, and as they turned their eyes that way they saw ripples in the grass coming from that direction also.'
).

	html section mdcDialog__content; with: [
		html paragraph: [
			html anchor url: 'https://www.gutenberg.org/ebooks/55'; target: '_blank'; with: 'Read the full book' ].
		paragraphs do: [ :eachParagraph | html paragraph: eachParagraph ] ]
]

{ #category : #'page - dialog' }
MCWDemoCatalogCanvas >> renderDialogSimpleOn: html [
	| dialogId |

	dialogId := html nextId.
	html div mdcDialog; id: dialogId; mdcRole: 'alertdialog'; mdcAutoInit: 'MDCDialog'; with: [
		html div mdcDialog__scrim.
		html div mdcDialog__container; with: [
			html div mdcDialog__surface; with: [
				html heading level2; mdcDialog__title; with: 'Select an account'.
				html section mdcDialog__content; with: [
					html unorderedList mdcList; mdcList_avatarList; style: 'list-style-typ: none'; with: [
						html listItem mdcListItem; tabIndex: 0; attributeAt: 'data-mdc-dialog-action' put: 'user1@example.com'; with: [
							html span mdcMaterialIcons; mdcDeprecatedListItem__graphic; with: 'person'.
							html span: 'user1@example.com' ].
						html listItem mdcListItem; attributeAt: 'data-mdc-dialog-action' put: 'user2@example.com'; with: [
							html span mdcMaterialIcons; mdcDeprecatedListItem__graphic; with: 'person'.
							html span: 'user2@example.com' ].
						html listItem mdcListItem; tabIndex: -1; attributeAt: 'data-mdc-dialog-action' put: 'add'; with: [
							html span mdcMaterialIcons; mdcDeprecatedListItem__graphic; with: 'add'.
							html span: 'Add account' ] ] ] ] ] ].

	^ dialogId
]

{ #category : #'utility - page' }
MCWDemoCatalogCanvas >> renderHeadline: aHeadline summary: aSummary on: html [

	html heading level1; mdcTypography_headline5; with: aHeadline.
	html paragraph mdcTypography_body1; with: aSummary

]

{ #category : #'utility - page' }
MCWDemoCatalogCanvas >> renderResources: resources on: html [

	html heading level6; class: 'demo-title'; mdcTypography_headline6; with: 'Resources'.
	html anchor
		url: resources first;
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcDeprecatedListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Material Design Guidelines icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg' ].
			html text: 'Material Design Guidelines' ].
	html anchor
		url: resources second;
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcDeprecatedListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Documentation icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_drive_document_24px.svg' ].
			html text: 'Documentation' ].
	html anchor
		url: resources third;
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcDeprecatedListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Source Code icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_code_24px.svg' ].
			html text: 'Source Code' ]
]
