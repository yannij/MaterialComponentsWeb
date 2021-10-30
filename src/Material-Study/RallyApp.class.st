"
I am a demo application inspired by the Rally Material Design Study (https://material.io/design/material-studies/rally.html). The data model uses Magritte meta-model (https://github.com/magritte-metamodel/magritte).
"
Class {
	#name : #RallyApp,
	#superclass : #MDSResponsiveApp,
	#instVars : [
		'loginComponent'
	],
	#classVars : [
		'RallyData'
	],
	#category : #'Material-Study-Rally'
}

{ #category : #initialization }
RallyApp class >> applicationPath [

	^ 'material/study-rally'
]

{ #category : #'class initialization' }
RallyApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath
]

{ #category : #actions }
RallyApp >> actionAccounts [

	self layout sideNavDismissIfModal.
	self layout bodyRegionContent: RallyAccountView new
]

{ #category : #actions }
RallyApp >> actionAlerts [

	self layout sideNavDismissIfModal.
	self layout bodyRegionContent: RallyAlertView new
]

{ #category : #actions }
RallyApp >> actionBills [

	self layout sideNavDismissIfModal.
	self layout bodyRegionContent: RallyBillView new
]

{ #category : #actions }
RallyApp >> actionBudgetItems [

	self layout sideNavDismissIfModal.
	self layout bodyRegionContent: RallyBudgetItemView new
]

{ #category : #actions }
RallyApp >> actionOverview [

	self layout sideNavDismissIfModal.
	self layout bodyRegionContent: RallyOverview new
]

{ #category : #accessing }
RallyApp >> applicationTitle [

	^ 'Rally'
]

{ #category : #initialization }
RallyApp >> buildLayout [

	^ MDSLayoutAutoResponsive on: self
]

{ #category : #initialization }
RallyApp >> buildLoginComponent [

	^ ShrineLogin new
		loginTitle: self applicationTitle;
		authenticationBlock: [ :username :password | #guest ];
		recoverBlock: [ :username :tokenTyped :tokenSent | #guest ];
		registerBlock: [ :username :password | #guest ];
		sendTokenBlock: [ :username | '' ];
		yourself
]

{ #category : #initialization }
RallyApp >> buildPopupMenuSettings [
	| list |

	list := (MDSMenuList id: 'settingsPopup')
		itemsAdd: (MDSListItem iconName: 'view_sidebar' itemText: 'Side Sheet' callback: [ self layout sideSheetHiddenToggle ]);
		"itemsAdd: (MDSListItem iconName: 'waves' itemText: 'Responsive' callback: [ self toggleAutoResponsive ]);"
		itemsAdd: (MDSListItem iconName: 'minimize' itemText: 'Collapse' callback: [ self layout topAappBarCollapsedToggle ]);
		itemsAdd: (MDSListItem iconName: 'all_out' itemText: 'Dense' callback: [ self layout denseViewToggle ]);
		"itemsAdd: (MDSListItem iconName: 'color_lens' itemText: 'Style' callback: [ self configureStyle ]);"
		itemsAdd: (MDSListItem iconName: 'login' itemText: 'Login' callback: [ self login ]);
		itemsAdd: (MDSListItem iconName: 'logout' itemText: 'Logout' callback: [ self logout ]);
		yourself.

	^ list
]

{ #category : #initialization }
RallyApp >> buildSideNavList [

	^ MDSList new
		itemsAdd: (MDSListItem itemText: 'Overview' iconName: '' callback: [ self actionOverview ]);
		itemsAdd: (MDSListItem itemText: 'Account''s' iconName: '' callback: [ self actionAccounts ]);
		itemsAdd: (MDSListItem itemText: 'Bill''s' iconName: '' callback: [ self actionBills ]);
		itemsAdd: (MDSListItem itemText: 'BudgetItem''s' iconName: '' callback: [ self actionBudgetItems ]);
		itemsAdd: (MDSListItem itemText: 'Alert''s' iconName: '' callback: [ self actionAlerts ]);
		yourself
]

{ #category : #accessing }
RallyApp >> colorTheme [

	^ {
#'primary' -> '1EB980'.
"#'on-primary' -> '000000'.
#'secondary' -> 'FF6859'.
#'on-secondary' -> '000000'.
#'surface' -> '121212'.
#'on-surface' -> 'FFFFFF'.
#'background' -> '121212'"
} asOrderedDictionary
]

{ #category : #initialization }
RallyApp >> initialize [

	super initialize.

	self materialVersionDefault.

	self layout: self buildLayout.
	self setupLayout
]

{ #category : #accessing }
RallyApp >> loginComponent [

	^ loginComponent
]

{ #category : #accessing }
RallyApp >> loginComponent: anObject [

	loginComponent := anObject
]

{ #category : #rendering }
RallyApp >> renderLayoutOn: html [

	self renderSetColorTheme: self colorTheme on: html.
	self renderSetTypographyFont: 'Roboto Condensed' on: html.

	self isLoggedIn
		ifTrue: [ html render: self layout ]
		ifFalse: [
			self loginComponent
				ifNotNil: [ :value | html render: value  ]
				ifNil: [
					"self anonymousLoginAllowed" true
						ifTrue: [ html render: self layout ]
						ifFalse: [
							self loginComponent ifNil: [ self loginComponent: self buildLoginComponent ].
							html render: self loginComponent ] ] ]
]

{ #category : #initialization }
RallyApp >> setupLayout [

	self setupTopAppBar.
	self layout sideNav content: self buildSideNavList.

	self layout initializeComplete
]

{ #category : #initialization }
RallyApp >> setupTopAppBar [
	| settingsPopup |

	settingsPopup := self buildPopupMenuSettings.

	self layout topAppBar
		title: self applicationTitle;
		startSectionAdd: self buildNavigationIcon;
		endSectionAdd: (MDSTopAppBarActionItem materialIcon: 'settings' onClickScript: settingsPopup openScript);
		endSectionAdd: settingsPopup
]

{ #category : #updating }
RallyApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	"anHtmlRoot stylesheet url: (WAUrl absolute: 'http://localhost:8081/assets/bundle.css')."
	"anHtmlRoot stylesheet url: (ShrineLibrary urlOf: #bundleCss).
	anHtmlRoot javascript url: 'https://js.stripe.com/v3/'"
]

{ #category : #updating }
RallyApp >> updateRootFonts: anHtmlRoot [

	super updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Roboto Condensed').
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Eczar').
	"anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Rubik:300,400,500')."

]
