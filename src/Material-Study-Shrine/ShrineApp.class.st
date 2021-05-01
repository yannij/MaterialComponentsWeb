Class {
	#name : #ShrineApp,
	#superclass : #MCWResponsiveApplication,
	#instVars : [
		'topSheet'
	],
	#category : #'Material-Study-Shrine'
}

{ #category : #initialization }
ShrineApp class >> applicationPath [

	^ 'material/shrine'

]

{ #category : #initialization }
ShrineApp class >> dockerSecretsFile [

	^ 'shrine.json'

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
ShrineApp class >> stripePublishableKey [
	| result |

	"
	ShrineApp stripePublishableKey
	"
	result := 'missing-stripPublishableKey'.
	self dockerSecrets
		ifNotNil: [ :secrets |
			secrets at: 'stripePublishableKey' ifPresent: [ :value | result := value ] ].
	^ result
]

{ #category : #accessing }
ShrineApp class >> stripeSecretKey [
	| result |

	"
	ShrineApp stripeSecretKey
	"
	result := 'missing-stripeSecretKey'.
	self dockerSecrets
		ifNotNil: [ :secrets |
			secrets at: 'stripeSecretKey' ifPresent: [ :value | result := value ] ].
	^ result
]

{ #category : #initialization }
ShrineApp >> appBarTitle [

	^ ''

]

{ #category : #accessing }
ShrineApp >> applicationTitle [

	^ 'Shrine'
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
ShrineApp >> buildMainFab [

	^ nil
]

{ #category : #initialization }
ShrineApp >> buildSideNav [

	^ (super buildSideNav)
		cssClass: 'shrine-drawer';
		yourself
]

{ #category : #initialization }
ShrineApp >> buildSideNavList [

	^ MCWListBasic new
		addListItem: (ShrineBranding new);
		addListItem: (MCWListItemIcon itemText: 'Featured' iconName: '' callback: [ ]);
		"Divider Line"
		addListItem: (MCWListItemIcon itemText: 'Apartment' iconName: '' callback: [ ]);
		addListItem: (MCWListItemIcon itemText: 'Accessories' iconName: '' callback: [ ]);
		addListItem: (MCWListItemIcon itemText: 'Shoes' iconName: '' callback: [ ]);
		addListItem: (MCWListItemIcon itemText: 'Tops' iconName: '' callback: [ ]);
		addListItem: (MCWListItemIcon itemText: 'Bottoms' iconName: '' callback: [ ]);
		addListItem: (MCWListItemIcon itemText: 'Dresses' iconName: '' callback: [ ]);
		addListItem: (MCWListItemIcon itemText: 'My Account' iconName: '' callback: [ ]);
		yourself.

]

{ #category : #initialization }
ShrineApp >> buildSideSheet [

	^ MCWSideSheet new
]

{ #category : #initialization }
ShrineApp >> buildTopSheet [

	^ ShrineTopSheet new
]

{ #category : #accessing }
ShrineApp >> colorThemeCustom [

	#(
('primary' '#FEDBD0')
('on-primary' '#442C2E')
('secondary' '#FEEAE6')
('on-secondary' '442C2E')
('surface:' '#FFFBFA')
('on-surface:' '#442C2E')
('background' '#FFFFFF')
('on-background' '#442C2E')
	) do: [ :each |
		self colorTheme at: each first put: each second ]
]

{ #category : #accessing }
ShrineApp >> colorThemeCustomDark [

	#(
('primary' '#FFCF44')
('on-primary' '#33333D')
('secondary' '#FFCF44')
('on-secondary' 'FFFFFF')
('surface:' '#33333D')
('on-surface:' '#FFFFFF')
('background' '#33333D')
('on-background' '#FFFFFF')
	) do: [ :each |
		self colorTheme at: each first put: each second ]
]

{ #category : #initialization }
ShrineApp >> initialize [

	super initialize.

	self layout contentArea component: ShrineCanvas new.
	self loginComponent: self buildLoginComponent.
	self topSheet: self buildTopSheet.

	self settings setFont: (MCWGoogleFont fontNamed: 'Rubik').

	self layout sideSheet component: self topSheet.

	"self colorThemeCustom.
	self colorThemeCustomDark.
	self colorThemeCss inspect"
]

{ #category : #accessing }
ShrineApp >> shrineTitle [

	^ '<h1 class="shrine-title">SHRINE</h1>'
]

{ #category : #accessing }
ShrineApp >> stripePublishableKey [

	^ self class stripePublishableKey
]

{ #category : #accessing }
ShrineApp >> stripeSecretKey [

	^ self class stripeSecretKey
]

{ #category : #accessing }
ShrineApp >> topSheet [
	^ topSheet
]

{ #category : #accessing }
ShrineApp >> topSheet: anObject [
	topSheet := anObject
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
