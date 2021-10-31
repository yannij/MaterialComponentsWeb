"
I am a demo application inspired by the Shrine Material Design Study (https://material.io/design/material-studies/shrine.html)
"
Class {
	#name : #ShrineApp,
	#superclass : #MDSResponsiveApp,
	#instVars : [
		'loginComponent',
		'shoppingCart',
		'stripeInterface',
		'tabs',
		'currentTab'
	],
	#category : #'Material-Study-Shrine'
}

{ #category : #initialization }
ShrineApp class >> applicationPath [

	^ 'material/study-shrine'
]

{ #category : #'class initialization' }
ShrineApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath
]

{ #category : #accessing }
ShrineApp class >> shrineSvg: aCssClass [

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
ShrineApp >> applicationTitle [

	^ 'Shrine'
]

{ #category : #initialization }
ShrineApp >> buildLayout [
	| newLayout |

	newLayout := (MDSLayoutAutoResponsive on: self)
		cssClass: 'shrine';
		yourself.

	^ newLayout
]

{ #category : #initialization }
ShrineApp >> buildLoginComponent [

	^ ShrineLogin new
		loginTitle: self applicationTitle;
		authenticationBlock: [ :username :password | #guest ];
		recoverBlock: [ :username :tokenTyped :tokenSent | #guest ];
		registerBlock: [ :username :password | #guest ];
		sendTokenBlock: [ :username | '' ];
		yourself
]

{ #category : #initialization }
ShrineApp >> buildPopupMenuSettings [
	| list |

	list := (MDSMenuList id: 'settingsPopup')
		itemsAdd: (MDSListItem iconName: 'view_sidebar' itemText: 'Side Sheet' callback: [ self layout sideSheetHiddenToggle ]);
		"itemsAdd: (MDSListItem iconName: 'waves' itemText: 'Responsive' callback: [ self toggleAutoResponsive ]);"
		itemsAdd: (MDSListItem iconName: 'minimize' itemText: 'Collapse' callback: [ self layout topAppBarCollapsedToggle ]);
		itemsAdd: (MDSListItem iconName: 'all_out' itemText: 'Dense' callback: [ self layout denseViewToggle ]);
		"itemsAdd: (MDSListItem iconName: 'color_lens' itemText: 'Style' callback: [ self configureStyle ]);"
		itemsAdd: (MDSListItem iconName: 'login' itemText: 'Login' callback: [ self login ]);
		itemsAdd: (MDSListItem iconName: 'logout' itemText: 'Logout' callback: [ self logout ]);
		yourself.

	^ list
]

{ #category : #initialization }
ShrineApp >> buildSideNavList [
	| newList |

	newList := MDSList new.
	newList itemsAdd: (ShrineBranding new).
	self categoryList do: [ :eachCategory |
		newList itemsAdd:
			(MDSListItem
				itemText: eachCategory
				iconName: ''
				callback: [ self layout sideNavDismissIfModal. self tabSet: eachCategory ]) ].

	^ newList
]

{ #category : #initialization }
ShrineApp >> buildTabs: aNumber [
	| newObject |

	newObject := MDSTabs new.
	self categoryList do: [ :tabLabel | | newTab |
		newTab := MDSTab label: tabLabel callback: [ self tabSet: tabLabel ].
		newTab showIcon: false.
		newObject tabsAdd: newTab ].
	
	^ newObject
]

{ #category : #initialization }
ShrineApp >> categoryList [

	^ #(
'Featured'
'Apartment'
'Accessories'
'Shoes'
'Tops'
'Bottoms'
'Dresses'
'My Account'
	)
]

{ #category : #accessing }
ShrineApp >> colorTheme [

	^ {
#'primary' -> 'FEDBD0'.
#'on-primary' -> '442C2E'.
#'secondary' -> 'FEEAE6'.
#'on-secondary' -> '442C2E'.
#'surface' -> 'FFFBFA'.
#'on-surface' -> '442C2E'.
#'background' -> 'FFFFFF'
} asOrderedDictionary
]

{ #category : #accessing }
ShrineApp >> currentTab [

	^ currentTab
]

{ #category : #accessing }
ShrineApp >> currentTab: anObject [

	currentTab := anObject
]

{ #category : #initialization }
ShrineApp >> initialize [

	self stripeInterface: StripeInterfaceBasic new.

	super initialize.

	self materialVersionDefault.

	self tabs: (self buildTabs: 6).
	self layout: self buildLayout.
	self setupLayout
]

{ #category : #accessing }
ShrineApp >> loginComponent [

	^ loginComponent
]

{ #category : #accessing }
ShrineApp >> loginComponent: anObject [

	loginComponent := anObject
]

{ #category : #rendering }
ShrineApp >> renderLayoutOn: html [

	self renderSetColorTheme: self colorTheme on: html.
	self renderSetTypographyFont: 'Rubik' on: html.

	self isLoggedIn
		ifTrue: [ html render: self layout ]
		ifFalse: [
			self loginComponent
				ifNotNil: [ :value | html render: value  ]
				ifNil: [
					"self anonymousLoginAllowed" false
						ifTrue: [ html render: self layout ]
						ifFalse: [
							self loginComponent ifNil: [ self loginComponent: self buildLoginComponent ].
							html render: self loginComponent ] ] ]
]

{ #category : #initialization }
ShrineApp >> setupLayout [

	self shoppingCart: self stripeInterface shoppingCartNew.

	self setupTopAppBar.
	self layout sideNav content: self buildSideNavList; cssClass: 'shrine-drawer'.
	self layout bodyRegion component: ShrineCanvas new.
	self layout sideSheet component: self shoppingCart.
	self setupLayoutSmall.

	self layout initializeComplete.
	(self layout layouts at: MDSLayoutAutoResponsive layoutSmall) topAppBar startSection: nil
]

{ #category : #initialization }
ShrineApp >> setupLayoutSmall [
	| tabletLayout |

	tabletLayout := MDSLayoutTopAppBarTabs on: self.
	tabletLayout topAppBar middleSection: self tabs.
	self layout layouts at: MDSLayoutAutoResponsive layoutSmall put: tabletLayout
]

{ #category : #initialization }
ShrineApp >> setupTopAppBar [
	| settingsPopup |

	settingsPopup := self buildPopupMenuSettings.

	self layout topAppBar
		title: self applicationTitle;
		startSectionAdd: self buildNavigationIcon;
		endSectionAdd: (MDSTopAppBarActionItem materialIcon: 'settings' onClickScript: settingsPopup openScript);
		endSectionAdd: settingsPopup
]

{ #category : #accessing }
ShrineApp >> shoppingCart [
	^ shoppingCart
]

{ #category : #accessing }
ShrineApp >> shoppingCart: anObject [
	shoppingCart := anObject
]

{ #category : #accessing }
ShrineApp >> shrineTitle [

	^ '<h1 class="shrine-title">SHRINE</h1>'
]

{ #category : #accessing }
ShrineApp >> stripeInterface [
	^ stripeInterface
]

{ #category : #accessing }
ShrineApp >> stripeInterface: anObject [
	stripeInterface := anObject
]

{ #category : #initialization }
ShrineApp >> tabSet: anObject [

	self currentTab: anObject.

	self tabs do: [ :eachTab | eachTab active: (eachTab label = anObject) ]
]

{ #category : #accessing }
ShrineApp >> tabs [

	^ tabs
]

{ #category : #accessing }
ShrineApp >> tabs: anObject [

	tabs := anObject
]

{ #category : #updating }
ShrineApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	"anHtmlRoot stylesheet url: (WAUrl absolute: 'http://localhost:8081/assets/bundle.css')."
	anHtmlRoot stylesheet url: (ShrineLibrary urlOf: #bundleCss).
	anHtmlRoot javascript url: 'https://js.stripe.com/v3/'

]

{ #category : #updating }
ShrineApp >> updateRootFonts: anHtmlRoot [

	super updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Rubik').
	"anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Rubik:300,400,500')."

]
