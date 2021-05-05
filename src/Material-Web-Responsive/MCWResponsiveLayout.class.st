Class {
	#name : #MCWResponsiveLayout,
	#superclass : #MCWComponent,
	#instVars : [
		'screenStyle',
		'contentArea',
		'topAppBar',
		'sideNav',
		'sideSheet',
		'mainFab'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #actions }
MCWResponsiveLayout >> adjustToolbarsDesktop [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	"self topAppBar startSection do: [:each |
		each iconName = 'menu' ifTrue: [each beHidden]]."

]

{ #category : #actions }
MCWResponsiveLayout >> adjustToolbarsMobile [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	self topAppBar startSection do: [ :each | each beUnHidden ].

]

{ #category : #actions }
MCWResponsiveLayout >> adjustToolbarsTablet [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	self topAppBar startSection do: [ :each | each beUnHidden ].

]

{ #category : #actions }
MCWResponsiveLayout >> beDesktopStyle [

	self screenStyle: #desktop.
	self sideNav bePersistentDrawer; beDismissed.
	self adjustToolbarsDesktop.

]

{ #category : #actions }
MCWResponsiveLayout >> beMobileStyle [

	self screenStyle: #mobile.
	self sideNav beModalDrawer; beDismissed.
	self adjustToolbarsMobile.

]

{ #category : #actions }
MCWResponsiveLayout >> beTabletStyle [

	self screenStyle: #tablet.
	self sideNav beDismissibleDrawer; beDismissed.
	self adjustToolbarsTablet.

]

{ #category : #rendering }
MCWResponsiveLayout >> cellSpan [

	self isMobileStyle ifTrue: [ ^ 4 ].
	self isTabletStyle ifTrue: [ ^ 8 ].
	^ 12
]

{ #category : #accessing }
MCWResponsiveLayout >> contentArea [
	^ contentArea
]

{ #category : #accessing }
MCWResponsiveLayout >> contentArea: anObject [
	contentArea := anObject
]

{ #category : #accessing }
MCWResponsiveLayout >> headStyle [

	self isMobileStyle ifTrue: [ ^ self headStyleMobile ].
	self isTabletStyle ifTrue: [ ^ self headStyleTablet ].
	^ self headStyleDesktop
]

{ #category : #accessing }
MCWResponsiveLayout >> headStyleDesktop [
	^ '
/* Ensure layout covers the entire screen. */
html {
  height: 100%;
}

.mcw-body {
  display: flex;
  flex-flow: row nowrap;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  min-height: 100%;
  width: 100%;
}
'
]

{ #category : #accessing }
MCWResponsiveLayout >> headStyleMobile [
	^ '
/* Ensure layout covers the entire screen. */
html {
  height: 100%;
}

.mcw-body {
  display: flex;
  flex-direction: row;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  min-height: 100%;
  width: 100%;
}
'
]

{ #category : #accessing }
MCWResponsiveLayout >> headStyleTablet [
	^ '
/* Ensure layout covers the entire screen. */
html {
  height: 100%;
}

.mcw-body {
  display: flex;
  flex-direction: row;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  min-height: 100%;
  width: 100%;
}
'
]

{ #category : #initialization }
MCWResponsiveLayout >> initialize [

	super initialize.

	self screenStyle: #desktop
]

{ #category : #testing }
MCWResponsiveLayout >> isDesktopStyle [

	^ self screenStyle = #desktop
]

{ #category : #testing }
MCWResponsiveLayout >> isMobileStyle [

	^ self screenStyle = #mobile
]

{ #category : #testing }
MCWResponsiveLayout >> isTabletStyle [

	^ self screenStyle = #tablet
]

{ #category : #accessing }
MCWResponsiveLayout >> mainFab [
	^ mainFab
]

{ #category : #accessing }
MCWResponsiveLayout >> mainFab: anObject [
	mainFab := anObject
]

{ #category : #actions }
MCWResponsiveLayout >> primaryRegionSet: aPrimaryRegion [

	self contentArea: aPrimaryRegion.
	aPrimaryRegion ifNotNil: [ :arg | aPrimaryRegion containingLayout: self ]
]

{ #category : #rendering }
MCWResponsiveLayout >> renderContentOn: html [

	self isMobileStyle ifTrue: [ ^ self renderLayoutMobileOn: html ].
	self isTabletStyle ifTrue: [ ^ self renderLayoutTabletOn: html ].
	self renderLayoutDesktopOn: html
]

{ #category : #rendering }
MCWResponsiveLayout >> renderLayoutDesktopOn: html [

	html render: self sideNav.
	html render: self topAppBar.

	html div mdcDrawerAppContent;
		style: 'width: calc(100% - 200px)';
		with: [
			| div |
			div := html tag: 'main'.
			self mcwDenseView
				ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
				ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
			div
				style: 'width: calc(100% - 200px)';
				class: 'mcw-layout-desktop';
				style: 'overflow-x: auto';
				with: self contentArea ].

	self sideSheet ifNotNil: [ :arg |
		| sideDiv |
		sideDiv := html div.
		sideDiv style: 'position: fixed; top: 0; right: 0; width: 200px'.
		self mcwDenseView
			ifTrue: [ sideDiv mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
			ifFalse:  [ sideDiv mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
		sideDiv with: self sideSheet ]

]

{ #category : #rendering }
MCWResponsiveLayout >> renderLayoutMobileOn: html [
	| div |

	html render: self sideNav.
	html render: self topAppBar.

	div := html div.
	self mcwDenseView
		ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
		ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
	div with: [ (html tag: 'main')
		class: 'mcw-layout-mobile';
		style: 'overflow-x: auto';
		style: 'padding-bottom: 40px';
		"style: 'min-width: 359px';
		style: 'max-width: 359px';"
		with: self contentArea ].

	self sideSheet ifNotNil: [ :arg |
		| sideDiv |
		sideDiv := html div.
		"sideDiv style: 'position: fixed; top: 0; right: 0'."
		self mcwDenseView
			ifTrue: [ sideDiv mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
			ifFalse:  [ sideDiv mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
		sideDiv with: self sideSheet ]
]

{ #category : #rendering }
MCWResponsiveLayout >> renderLayoutTabletOn: html [

	html render: self sideNav.

	html div mdcDrawerAppContent; style: 'width: calc(100% - 200px)'; with: [
		| div |
		html render: self topAppBar.
		div := html div.
		self mcwDenseView
			ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
			ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
		div
				style: 'width: calc(100% - 200px)';
				class: 'mcw-layout-tablet';
				style: 'overflow-x: auto';
				with: self contentArea ].

	self sideSheet ifNotNil: [ :arg |
		| sideDiv |
		sideDiv := html div.
		sideDiv style: 'position: fixed; top: 0; right: 0'.
		self mcwDenseView
			ifTrue: [ sideDiv mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
			ifFalse:  [ sideDiv mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
		sideDiv with: self sideSheet ]
]

{ #category : #accessing }
MCWResponsiveLayout >> screenStyle [
	^ screenStyle
]

{ #category : #accessing }
MCWResponsiveLayout >> screenStyle: anObject [
	screenStyle := anObject
]

{ #category : #accessing }
MCWResponsiveLayout >> sideNav [
	^ sideNav
]

{ #category : #accessing }
MCWResponsiveLayout >> sideNav: anObject [
	sideNav := anObject
]

{ #category : #accessing }
MCWResponsiveLayout >> sideSheet [
	^ sideSheet
]

{ #category : #accessing }
MCWResponsiveLayout >> sideSheet: anObject [
	sideSheet := anObject
]

{ #category : #actions }
MCWResponsiveLayout >> sideSheetSet: aSideSheet [

	self sideSheet: aSideSheet.
	aSideSheet ifNotNil: [ :arg | aSideSheet containingLayout: self ]
]

{ #category : #accessing }
MCWResponsiveLayout >> topAppBar [
	^ topAppBar
]

{ #category : #accessing }
MCWResponsiveLayout >> topAppBar: anObject [
	topAppBar := anObject
]
