Class {
	#name : #MCWLayout,
	#superclass : #MCWWebComponent,
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
MCWLayout >> adjustToolbarsDesktop [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	"self topAppBar startSection do: [:each |
		each iconName = 'menu' ifTrue: [each beHidden]]."

]

{ #category : #actions }
MCWLayout >> adjustToolbarsMobile [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	self topAppBar startSection do: [ :each | each beUnHidden ].

]

{ #category : #actions }
MCWLayout >> adjustToolbarsTablet [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	self topAppBar startSection do: [ :each | each beUnHidden ].

]

{ #category : #actions }
MCWLayout >> beDesktopStyle [

	self screenStyle: #desktop.
	self sideNav bePersistentDrawer; beDismissed.
	self adjustToolbarsDesktop.

]

{ #category : #actions }
MCWLayout >> beMobileStyle [

	self screenStyle: #mobile.
	self sideNav beModalDrawer; beDismissed.
	self adjustToolbarsMobile.

]

{ #category : #actions }
MCWLayout >> beTabletStyle [

	self screenStyle: #tablet.
	self sideNav beDismissibleDrawer; beDismissed.
	self adjustToolbarsTablet.

]

{ #category : #accessing }
MCWLayout >> contentArea [
	^ contentArea
]

{ #category : #accessing }
MCWLayout >> contentArea: anObject [
	contentArea := anObject
]

{ #category : #accessing }
MCWLayout >> headStyle [

	self isMobileStyle ifTrue: [ ^ self headStyleMobile ].
	self isTabletStyle ifTrue: [ ^ self headStyleTablet ].
	^ self headStyleDesktop
]

{ #category : #accessing }
MCWLayout >> headStyleDesktop [
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
MCWLayout >> headStyleMobile [
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
MCWLayout >> headStyleTablet [
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
MCWLayout >> initialize [

	super initialize.

	self screenStyle: #desktop
]

{ #category : #testing }
MCWLayout >> isDesktopStyle [

	^ self screenStyle = #desktop
]

{ #category : #testing }
MCWLayout >> isMobileStyle [

	^ self screenStyle = #mobile
]

{ #category : #testing }
MCWLayout >> isTabletStyle [

	^ self screenStyle = #tablet
]

{ #category : #accessing }
MCWLayout >> mainFab [
	^ mainFab
]

{ #category : #accessing }
MCWLayout >> mainFab: anObject [
	mainFab := anObject
]

{ #category : #actions }
MCWLayout >> primaryRegionSet: aPrimaryRegion [

	self contentArea: aPrimaryRegion.
	aPrimaryRegion ifNotNil: [ :arg | aPrimaryRegion containingLayout: self ]
]

{ #category : #rendering }
MCWLayout >> renderContentAreaDesktopOn: html [

	(html tag: 'main')
		class: 'mcw-layout-desktop';
		style: 'overflow-x: auto';
		"No padding for desktop, because no bottom bar"
		"style: 'padding-bottom: 40px';"
		"style: 'position: relative';"
		style: 'min-width: 1279px';
		style: 'max-width: 1279px';
		with: [
			html render: self contentArea.
			html render: self mainFab ]
]

{ #category : #rendering }
MCWLayout >> renderContentAreaMobileOn: html [

	(html tag: 'main')
		class: 'mcw-layout-mobile';
		style: 'overflow-x: auto';
		style: 'padding-bottom: 40px';
		style: 'min-width: 359px';
		style: 'max-width: 359px';
		with: [
			html render: self contentArea.
			html render: self mainFab ]
]

{ #category : #rendering }
MCWLayout >> renderContentAreaTabletOn: html [

	(html tag: 'main')
		class: 'mcw-layout-tablet';
		style: 'overflow-x: auto';
		style: 'padding-bottom: 40px';
		style: 'min-width: 959px';
		style: 'max-width: 959px';
		with: [
			html render: self contentArea.
			html render: self mainFab ]

]

{ #category : #rendering }
MCWLayout >> renderContentOn: html [

	self isMobileStyle ifTrue: [ ^ self renderLayoutMobileOn: html ].
	self isTabletStyle ifTrue: [ ^ self renderLayoutTabletOn: html ].
	self renderLayoutDesktopOn: html
]

{ #category : #rendering }
MCWLayout >> renderLayoutDesktopOn: html [

	html render: self sideNav.
	html render: self topAppBar.

	html div mdcDrawerAppContent; with: [
		| div |
		div := html div.
		self mcwDenseView
			ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
			ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
		div with: [ self renderContentAreaDesktopOn: html ] ].

	self sideSheet ifNotNil: [ :arg |
		| div |
		div := html div.
		div style: 'min-width: 320px; max-width: 320px'.
		self mcwDenseView
			ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
			ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
		div with: [ html render: self sideSheet ] ]

]

{ #category : #rendering }
MCWLayout >> renderLayoutMobileOn: html [

	html render: self sideNav.

	html div
		with: [
			| div |
			html render: self topAppBar.
			div := html div.
			self mcwDenseView
				ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
				ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
			div with: [ self renderContentAreaMobileOn: html ].
			html render: self sideSheet ]
]

{ #category : #rendering }
MCWLayout >> renderLayoutTabletOn: html [
	| sideDiv |

	html render: self sideNav.

	html div
		mdcDrawerAppContent;
		with: [
			| div |
			html render: self topAppBar.
			div := html div.
			self mcwDenseView
				ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
				ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
			div with: [ self renderContentAreaTabletOn: html ].
		].

	sideDiv := html div.
	self mcwDenseView
		ifTrue: [ sideDiv mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
		ifFalse:  [ sideDiv mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
	sideDiv with: [ html render: self sideSheet ]

]

{ #category : #accessing }
MCWLayout >> screenStyle [
	^ screenStyle
]

{ #category : #accessing }
MCWLayout >> screenStyle: anObject [
	screenStyle := anObject
]

{ #category : #accessing }
MCWLayout >> sideNav [
	^ sideNav
]

{ #category : #accessing }
MCWLayout >> sideNav: anObject [
	sideNav := anObject
]

{ #category : #accessing }
MCWLayout >> sideSheet [
	^ sideSheet
]

{ #category : #accessing }
MCWLayout >> sideSheet: anObject [
	sideSheet := anObject
]

{ #category : #actions }
MCWLayout >> sideSheetSet: aSideSheet [

	self sideSheet: aSideSheet.
	aSideSheet ifNotNil: [ :arg | aSideSheet containingLayout: self ]
]

{ #category : #accessing }
MCWLayout >> topAppBar [
	^ topAppBar
]

{ #category : #accessing }
MCWLayout >> topAppBar: anObject [
	topAppBar := anObject
]
