Class {
	#name : #MCWResponsiveLayout,
	#superclass : #MCWComponent,
	#instVars : [
		'app',
		'maxWidth',
		'screenStyle',
		'contentArea',
		'topAppBar',
		'sideNav',
		'sideSheet',
		'mainFab',
		'settingsView',
		'cssStyle'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MCWResponsiveLayout class >> defaultMaxWidth [

	^ 1920 "- 80" "decrease for scrollbar"
]

{ #category : #accessing }
MCWResponsiveLayout class >> layoutDesktop [

	^ #large
]

{ #category : #accessing }
MCWResponsiveLayout class >> layoutLaptop [

	^ #medium
]

{ #category : #accessing }
MCWResponsiveLayout class >> layoutPhone [

	^ #'extra-small'
]

{ #category : #accessing }
MCWResponsiveLayout class >> layoutTablet [

	^ #small
]

{ #category : #'instance creation' }
MCWResponsiveLayout class >> on: aResponsiveApplication [

	^ self new
		app: aResponsiveApplication;
		yourself
]

{ #category : #actions }
MCWResponsiveLayout >> adjustToolbarsDesktop [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	"self topAppBar startSection do: [:each |
		each iconName = 'menu' ifTrue: [each beHidden]]."

]

{ #category : #actions }
MCWResponsiveLayout >> adjustToolbarsPhone [

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

{ #category : #accessing }
MCWResponsiveLayout >> app [
	^ app
]

{ #category : #accessing }
MCWResponsiveLayout >> app: anObject [
	app := anObject
]

{ #category : #actions }
MCWResponsiveLayout >> beDesktopStyle [

	self screenStyle: self class layoutDesktop.
	self sideNav bePersistentDrawer; beDismissed.
	self adjustToolbarsDesktop.

]

{ #category : #actions }
MCWResponsiveLayout >> beLaptopStyle [

	self screenStyle: self class layoutLaptop.
	self sideNav bePersistentDrawer; beDismissed.
	self adjustToolbarsDesktop.

]

{ #category : #actions }
MCWResponsiveLayout >> bePhoneStyle [

	self screenStyle: self class layoutPhone.
	self sideNav beModalDrawer; beDismissed.
	self adjustToolbarsPhone.

]

{ #category : #actions }
MCWResponsiveLayout >> beTabletStyle [

	self screenStyle: self class layoutTablet.
	self sideNav beDismissibleDrawer; beDismissed.
	self adjustToolbarsTablet.

]

{ #category : #'rendering-width' }
MCWResponsiveLayout >> cellSpan [

	self isPhoneStyle ifTrue: [ ^ 6 ].
	self isTabletStyle ifTrue: [ ^ 6 ].
	^ 6
]

{ #category : #accessing }
MCWResponsiveLayout >> contentArea [
	^ contentArea
]

{ #category : #accessing }
MCWResponsiveLayout >> contentArea: anObject [
	contentArea := anObject
]

{ #category : #rendering }
MCWResponsiveLayout >> contentToShow [

	^ self settingsView isHidden
		ifTrue: [ self contentArea ]
		ifFalse: [ self settingsView ]
]

{ #category : #accessing }
MCWResponsiveLayout >> cssStyle [
	^ cssStyle
]

{ #category : #accessing }
MCWResponsiveLayout >> cssStyle: anObject [
	cssStyle := anObject
]

{ #category : #accessing }
MCWResponsiveLayout >> headStyle [

	self isPhoneStyle ifTrue: [ ^ self headStylePhone ].
	self isTabletStyle ifTrue: [ ^ self headStyleTablet ].
	^ self headStyleDesktop
]

{ #category : #accessing }
MCWResponsiveLayout >> headStyleDesktop [

	^ ''
]

{ #category : #accessing }
MCWResponsiveLayout >> headStylePhone [

	^ ''
]

{ #category : #accessing }
MCWResponsiveLayout >> headStyleTablet [

	^ ''
]

{ #category : #initialization }
MCWResponsiveLayout >> initialize [

	super initialize.

	self maxWidth: self class defaultMaxWidth.
	self settingsView: (MCWApplicationSettingsView on: self).
	self screenStyle: self class layoutDesktop
]

{ #category : #testing }
MCWResponsiveLayout >> isDesktopStyle [

	^ self screenStyle = self class layoutDesktop
]

{ #category : #testing }
MCWResponsiveLayout >> isLaptopStyle [

	^ self screenStyle = self class layoutLaptop
]

{ #category : #testing }
MCWResponsiveLayout >> isPhoneStyle [

	^ self screenStyle = self class layoutPhone
]

{ #category : #testing }
MCWResponsiveLayout >> isTabletStyle [

	^ self screenStyle = self class layoutTablet
]

{ #category : #accessing }
MCWResponsiveLayout >> mainFab [
	^ mainFab
]

{ #category : #accessing }
MCWResponsiveLayout >> mainFab: anObject [
	mainFab := anObject
]

{ #category : #accessing }
MCWResponsiveLayout >> maxWidth [
	^ maxWidth
]

{ #category : #accessing }
MCWResponsiveLayout >> maxWidth: anObject [
	maxWidth := anObject
]

{ #category : #'rendering-width' }
MCWResponsiveLayout >> maxWidthContentArea [
	| result |

	result := self maxWidth.
	self sideNavVisible ifTrue: [ result := result - self sideNavWidth ].
	"self sideSheetVisible ifTrue: [ result := result - self sideSheetWidth ]."

	^ result
]

{ #category : #rendering }
MCWResponsiveLayout >> renderContentOn: html [

	self isPhoneStyle ifTrue: [ ^ self renderLayoutPhoneOn: html ].
	self isTabletStyle ifTrue: [ ^ self renderLayoutTabletOn: html ].
	self isLaptopStyle ifTrue: [ ^ self renderLayoutLaptopOn: html ].
	self renderLayoutDesktopOn: html
]

{ #category : #rendering }
MCWResponsiveLayout >> renderLayoutDesktopOn: html [

	html div class: self cssStyle if: (self cssStyle notNil); style: 'height: 100vh'; with: self sideNav.
	html render: self topAppBar.

	html div
		"style: 'max-width: 1920px';"
		mdcDrawerAppContent;
		with: [
			| div |
			div := html div.
			self mcwDenseView
				ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
				ifFalse: [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
			div
				style: 'float: left';
				style: 'overflow-x: auto';
				"mdcStyle: self contentAreaWidthCalc if: self sideSheetVisible;"
				class: 'mcw-layout-desktop';
				with: self contentToShow ].

	self renderSideSheetOn: html
]

{ #category : #rendering }
MCWResponsiveLayout >> renderLayoutLaptopOn: html [

	html div class: self cssStyle if: (self cssStyle notNil); style: 'height: 100vh'; with: self sideNav.
	html render: self topAppBar.

	html div
		"style: 'max-width: 1920px';"
		mdcDrawerAppContent;
		with: [
			| div |
			div := html div.
			self mcwDenseView
				ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
				ifFalse: [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
			div
				style: 'float: left';
				style: 'overflow-x: auto';
				"mdcStyle: self contentAreaWidthCalc if: self sideSheetVisible;"
				class: 'mcw-layout-desktop';
				with: self contentToShow ].

	self renderSideSheetOn: html
]

{ #category : #rendering }
MCWResponsiveLayout >> renderLayoutPhoneOn: html [
	| div |

	html render: self sideNav.
	html render: self topAppBar.

	div := html div.
	self mcwDenseView
		ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
		ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
	div with: [
		html div
			class: 'mcw-layout-mobile';
			style: 'overflow-x: auto';
			style: 'padding-bottom: 40px';
			"style: 'min-width: 359px';
			style: 'max-width: 359px';"
			with: self contentToShow ].

	self renderSideSheetOn: html
]

{ #category : #rendering }
MCWResponsiveLayout >> renderLayoutTabletOn: html [

	html render: self sideNav.

	html div mdcDrawerAppContent;
		with: [
			| div |
			html render: self topAppBar.
			div := html div.
			self mcwDenseView
				ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
				ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
			div
				"style: 'border: 2px solid red';"
				style: 'float: left';
				style: 'overflow-x: auto';
				"mdcStyle: self contentAreaWidthCalc if: self sideSheetVisible;"
				class: 'mcw-layout-tablet';
				with: self contentToShow ].

	self renderSideSheetOn: html
]

{ #category : #rendering }
MCWResponsiveLayout >> renderSideSheetOn: html [
	| sideDiv |

	self sideSheetVisible ifFalse: [ ^ self ].

	sideDiv := html div
		"style: 'border: 2px solid blue';"
		style: 'position: absolute; top: 0; right: 0';
		"style: 'float: right';"
		style: 'width: ', self sideSheetWidth printString, 'px';
		yourself.
	self mcwDenseView
		ifTrue: [ sideDiv mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
		ifFalse: [ sideDiv mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
	sideDiv with: self sideSheet
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
MCWResponsiveLayout >> settingsView [
	^ settingsView
]

{ #category : #accessing }
MCWResponsiveLayout >> settingsView: anObject [
	settingsView := anObject
]

{ #category : #accessing }
MCWResponsiveLayout >> sideNav [
	^ sideNav
]

{ #category : #accessing }
MCWResponsiveLayout >> sideNav: anObject [
	sideNav := anObject
]

{ #category : #testing }
MCWResponsiveLayout >> sideNavVisible [

	^ self sideNav
		ifNil: [ false ]
		ifNotNil: [ :value |
			self isDesktopStyle or: [ self isTabletStyle and: [ value isDrawerOpen ] ] ]
]

{ #category : #'rendering-width' }
MCWResponsiveLayout >> sideNavWidth [

	^ 256
]

{ #category : #accessing }
MCWResponsiveLayout >> sideSheet [
	^ sideSheet
]

{ #category : #accessing }
MCWResponsiveLayout >> sideSheet: anObject [
	sideSheet := anObject
]

{ #category : #testing }
MCWResponsiveLayout >> sideSheetVisible [

	^ self sideSheet
		ifNil: [ false ]
		ifNotNil: [ :value | value isHidden not ]
]

{ #category : #'rendering-width' }
MCWResponsiveLayout >> sideSheetWidth [

	^ 256
]

{ #category : #accessing }
MCWResponsiveLayout >> topAppBar [
	^ topAppBar
]

{ #category : #accessing }
MCWResponsiveLayout >> topAppBar: anObject [
	topAppBar := anObject
]
