Class {
	#name : #MCWShrineApp,
	#superclass : #MCWResponsiveApplication,
	#category : 'Material-Study-Shrine'
}

{ #category : #initialization }
MCWShrineApp class >> applicationPath [

	^'material/shrine'

]

{ #category : #initialization }
MCWShrineApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^self registerToDevelopment: self applicationPath

]

{ #category : #initialization }
MCWShrineApp >> appBarTitle [

	^''

]

{ #category : #accessing }
MCWShrineApp >> applicationTitle [

	^'Shrine'
]

{ #category : #initialization }
MCWShrineApp >> buildMainFab [

	^nil
]

{ #category : #initialization }
MCWShrineApp >> buildSideNav [

	^(super buildSideNav)
		cssClass: 'shrine-drawer';
		yourself
]

{ #category : #initialization }
MCWShrineApp >> buildSideNavList [

	^MCWListBasic new
		addListItem: (MCWShrineBranding new);
		addListItem: (MCWListItemIcon itemText: 'Featured' iconName: '' callback: []);
		"Divider Line"
		addListItem: (MCWListItemIcon itemText: 'Apartment' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Accessories' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Shoes' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Tops' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Bottoms' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'Dresses' iconName: '' callback: []);
		addListItem: (MCWListItemIcon itemText: 'My Account' iconName: '' callback: []);
		yourself.

]

{ #category : #accessing }
MCWShrineApp >> colorThemeCustom [

	#(
('primary' '#FEDBD0')
('on-primary' '#442C2E')
('secondary' '#FEEAE6')
('on-secondary' '442C2E')
('surface:' '#FFFBFA')
('on-surface:' '#442C2E')
('background' '#FFFFFF')
('on-background' '#442C2E')
	) do: [:each |
		self colorTheme at: each first put: each second]
]

{ #category : #accessing }
MCWShrineApp >> colorThemeCustomDark [

	#(
('primary' '#FFCF44')
('on-primary' '#33333D')
('secondary' '#FFCF44')
('on-secondary' 'FFFFFF')
('surface:' '#33333D')
('on-surface:' '#FFFFFF')
('background' '#33333D')
('on-background' '#FFFFFF')
	) do: [:each |
		self colorTheme at: each first put: each second]
]

{ #category : #initialization }
MCWShrineApp >> initialize [

	super initialize.

	self layout contentArea component: MCWShrineCanvas new.
	self loginComponent: MCWShrineLogin new.

	self settings setFont: (MCWGoogleFont fontNamed: 'Rubik').

	"self colorThemeCustom.
	self colorThemeCustomDark.
	self colorThemeCss inspect"
]

{ #category : #accessing }
MCWShrineApp >> shrineIcon [

	^'<svg class="shrine-logo-drawer" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="48px" height="48px" viewBox="0 0 24 24" enable-background="new 0 0 24 24" xml:space="preserve" fill="#000000">
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
MCWShrineApp >> shrineTitle [

	^'<h1 class="shrine-title">SHRINE</h1>'
]

{ #category : #updating }
MCWShrineApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	"anHtmlRoot stylesheet url: (WAUrl absolute: 'http://localhost:8081/assets/bundle.css')."
	anHtmlRoot stylesheet url: (MCWShrineLibrary urlOf: #bundleCss).

]

{ #category : #updating }
MCWShrineApp >> updateRootFonts: anHtmlRoot [

	super updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Rubik').
	"anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Rubik:300,400,500')."

]
