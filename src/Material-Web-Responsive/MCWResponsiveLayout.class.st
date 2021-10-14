Class {
	#name : #MCWResponsiveLayout,
	#superclass : #WAComponent,
	#instVars : [
		'app',
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

{ #category : #accessing }
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

{ #category : #initialization }
MCWResponsiveLayout >> initialize [

	super initialize.

	self settingsView: MDMApplicationSettingsView new.
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

{ #category : #rendering }
MCWResponsiveLayout >> renderContentOn: html [

	self isPhoneStyle ifTrue: [ ^ self renderLayoutPhoneOn: html ].
	self isTabletStyle ifTrue: [ ^ self renderLayoutTabletOn: html ].
	self isLaptopStyle ifTrue: [ ^ self renderLayoutLaptopOn: html ].
	self renderLayoutDesktopOn: html
]

{ #category : #rendering }
MCWResponsiveLayout >> renderContentToShowOn: html [

	self renderSnackbarOn: html.

	self sideSheetVisible ifFalse: [
		"self renderBannerDesktopOn: html."
		html render: self contentToShow.
		^ self ].

	html div mdcLayoutGrid; style: 'padding: 0px'; with: [
		html div mdcLayoutGrid__inner; style: 'grid-gap: 0px'; with: [
			"html div
				mdcLayoutGrid__cell_span12;
				with: [
					self renderBannerDesktopOn: html ]"
			html div
				mdcLayoutGrid__cell;
				mdcLayoutGrid__cell_span9Desktop;
				mdcLayoutGrid__cell_span6Tablet;
				mdcLayoutGrid__cell_span4Phone;
				with: [
					html render: self contentToShow ].
			html div
				mdcLayoutGrid__cell;
				mdcLayoutGrid__cell_span3Desktop;
				mdcLayoutGrid__cell_span2Tablet;
				mdcLayoutGrid__cell_span4Phone;
				with: [ html render: self sideSheet ] ] ]
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
				with: [
					self renderContentToShowOn: html ] ]
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
				with: [ self renderContentToShowOn: html ] ]
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
			with: [ self renderContentToShowOn: html ] ]
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
				with: [ self renderContentToShowOn: html ] ]
]

{ #category : #rendering }
MCWResponsiveLayout >> renderSnackbarOn: html [
	| snackbarId |

	self snackbarText ifNil: [ ^ self ].

	snackbarId := html nextId.
	html aside mdcSnackbar; mdcAutoInit: 'MDCSnackbar'; mdcSnackbar_open; with: [
		html div mdcSnackbar__surface; mdcRole: 'status'; with: [
			html div mdcSnackbar__label; with: self snackbarText.
			html div mdcSnackbar__actions; with: [
				html button mdcButton; mdcSnackbar__action;
					style: 'color: var(--mdc-theme-secondary)';
					onClick: ((html jQuery ajax) callback: [ self snackbarText: nil ]; onComplete: html javascript refresh; yourself);
					with: [
						"html div mdcButton__ripple."
						html span mdcButton__label; with: 'Clear' ] ] ] ].

	"html document addLoadScript: (JSStream on: 'document.querySelector(''.mdc-snackbar'').MDCSnackbar.open()')."
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
		ifNotNil: [ :value | value isHidden not and: [ value component notNil ] ]
]

{ #category : #actions }
MCWResponsiveLayout >> snackbarText [

	^ self app snackbarText
]

{ #category : #actions }
MCWResponsiveLayout >> snackbarText: anObject [

	self app snackbarText: anObject
]

{ #category : #accessing }
MCWResponsiveLayout >> topAppBar [
	^ topAppBar
]

{ #category : #accessing }
MCWResponsiveLayout >> topAppBar: anObject [
	topAppBar := anObject
]
