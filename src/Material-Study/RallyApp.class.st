Class {
	#name : #RallyApp,
	#superclass : #MDSResponsiveApp,
	#instVars : [
		'loginComponent',
		'shoppingCart',
		'stripeInterface'
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

{ #category : #accessing }
RallyApp class >> shrineSvg: aCssClass [

	^ '<svg class="', aCssClass, '" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="48px" height="48px" viewBox="0 0 24 24" enable-background="new 0 0 24 24" xml:space="preserve" fill="#000000">
      <g id="XMLID_2_">
        <g id="XMLID_4_">
          <path id="XMLID_5_" d="M17,2H7L2,6.62L12,22L22,6.62L17,2z M16.5,3.58l3.16,2.92H16.5V3.58z M7.59,3.5H15v3H4.34L7.59,3.5z     M11.25,18.1L7.94,13h3.31V18.1z M11.25,11.5H6.96L4.69,8h6.56V11.5z M16.5,12.32 M12.75,18.09V8h6.56L12.75,18.09z"/>
        </g>
        <rect id="XMLID_1_" fill="none" width="24" height="24"/>
      </g>
    </svg>
'
]

{ #category : #accessing }
RallyApp >> applicationTitle [

	^ 'Rally'
]

{ #category : #initialization }
RallyApp >> buildBodyRegion [

	^ MDSBodyRegion new
		"component: ShrineCanvas new;"
		yourself
]

{ #category : #initialization }
RallyApp >> buildLayout [

	^ (MDSLayoutAutoResponsive on: self)
		initializeComplete;
		yourself
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
RallyApp >> buildSideNav [

	^ (MDSDrawer content: self buildSideNavList)
		"cssClass: 'shrine-drawer';"
		yourself
]

{ #category : #initialization }
RallyApp >> buildSideNavList [

	^ MDSList new
		itemsAdd: (MDSListItem itemText: 'Overview' iconName: '' callback: [ self sideNav menuItemCallback ]);
		itemsAdd: (MDSListItem itemText: 'Account''s' iconName: '' callback: [ self sideNav menuItemCallback ]);
		itemsAdd: (MDSListItem itemText: 'Bill''s' iconName: '' callback: [ self sideNav menuItemCallback ]);
		itemsAdd: (MDSListItem itemText: 'BudgetItem''s' iconName: '' callback: [ self sideNav menuItemCallback ]);
		itemsAdd: (MDSListItem itemText: 'Alert''s' iconName: '' callback: [ self sideNav menuItemCallback ]);
		yourself
]

{ #category : #initialization }
RallyApp >> buildSideSheet [

	^ MDSSideSheet new
]

{ #category : #initialization }
RallyApp >> buildTopAppBar [
	| settingsPopup |

	settingsPopup := self buildPopupMenuSettings.

	^ (MDSTopAppBar title: self applicationTitle)
		startSectionAdd: self buildNavigationIcon;
		endSectionAdd: (MDSTopAppBarActionItem materialIcon: 'settings' onClickScript: settingsPopup openScript);
		endSectionAdd: settingsPopup;
		yourself
]

{ #category : #accessing }
RallyApp >> colorTheme [

	^ {
"#'primary' -> '1EB980'.
#'on-primary' -> '000000'.
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

	self initializeLayout
]

{ #category : #initialization }
RallyApp >> initializeLayout [

	self materialVersionDefault.

	self topAppBar: self buildTopAppBar .
	self sideNav: self buildSideNav.
	self bodyRegion: self buildBodyRegion.
	self sideSheet: self buildSideSheet.

	self layout: self buildLayout
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
