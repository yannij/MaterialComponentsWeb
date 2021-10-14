Class {
	#name : #MDSDesktopLayout,
	#superclass : #MDSLayout,
	#instVars : [
		'screenStyle',
		'settingsView',
		'cssStyle'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #actions }
MDSDesktopLayout >> adjustToolbarsDesktop [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	"self topAppBar startSection do: [:each |
		each iconName = 'menu' ifTrue: [each beHidden]]."

]

{ #category : #actions }
MDSDesktopLayout >> adjustToolbarsPhone [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	self topAppBar startSection do: [ :each | each beUnHidden ].

]

{ #category : #actions }
MDSDesktopLayout >> adjustToolbarsTablet [

	"self topAppBar dense: false."
	"self topAppBar startSection: self rootComponent appBarStartSection."
	self topAppBar startSection do: [ :each | each beUnHidden ].

]

{ #category : #accessing }
MDSDesktopLayout >> app [
	^ app
]

{ #category : #accessing }
MDSDesktopLayout >> app: anObject [
	app := anObject
]

{ #category : #actions }
MDSDesktopLayout >> beDesktopStyle [

	self screenStyle: self class layoutDesktop.
	self sideNav bePersistentDrawer; beDismissed.
	self adjustToolbarsDesktop.

]

{ #category : #actions }
MDSDesktopLayout >> beLaptopStyle [

	self screenStyle: self class layoutLaptop.
	self sideNav bePersistentDrawer; beDismissed.
	self adjustToolbarsDesktop.

]

{ #category : #actions }
MDSDesktopLayout >> bePhoneStyle [

	self screenStyle: self class layoutPhone.
	self sideNav beModalDrawer; beDismissed.
	self adjustToolbarsPhone.

]

{ #category : #actions }
MDSDesktopLayout >> beTabletStyle [

	self screenStyle: self class layoutTablet.
	self sideNav beDismissibleDrawer; beDismissed.
	self adjustToolbarsTablet.

]

{ #category : #accessing }
MDSDesktopLayout >> cellSpan [

	self isPhoneStyle ifTrue: [ ^ 6 ].
	self isTabletStyle ifTrue: [ ^ 6 ].
	^ 6
]

{ #category : #rendering }
MDSDesktopLayout >> contentToShow [

	^ self settingsView isHidden
		ifTrue: [ self contentArea ]
		ifFalse: [ self settingsView ]
]

{ #category : #accessing }
MDSDesktopLayout >> cssStyle [
	^ cssStyle
]

{ #category : #accessing }
MDSDesktopLayout >> cssStyle: anObject [
	cssStyle := anObject
]

{ #category : #initialization }
MDSDesktopLayout >> initialize [

	super initialize.

	self settingsView: MDMApplicationSettingsView new.
	self screenStyle: self class layoutDesktop
]

{ #category : #testing }
MDSDesktopLayout >> isDesktopStyle [

	^ self screenStyle = self class layoutDesktop
]

{ #category : #testing }
MDSDesktopLayout >> isLaptopStyle [

	^ self screenStyle = self class layoutLaptop
]

{ #category : #testing }
MDSDesktopLayout >> isPhoneStyle [

	^ self screenStyle = self class layoutPhone
]

{ #category : #testing }
MDSDesktopLayout >> isTabletStyle [

	^ self screenStyle = self class layoutTablet
]

{ #category : #rendering }
MDSDesktopLayout >> renderContentOn: html [

	self isPhoneStyle ifTrue: [ ^ self renderLayoutPhoneOn: html ].
	self isTabletStyle ifTrue: [ ^ self renderLayoutTabletOn: html ].
	self isLaptopStyle ifTrue: [ ^ self renderLayoutLaptopOn: html ].
	self renderLayoutDesktopOn: html
]

{ #category : #rendering }
MDSDesktopLayout >> renderContentToShowOn: html [

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
MDSDesktopLayout >> renderLayoutDesktopOn: html [

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
MDSDesktopLayout >> renderLayoutLaptopOn: html [

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
MDSDesktopLayout >> renderLayoutPhoneOn: html [
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
MDSDesktopLayout >> renderLayoutTabletOn: html [

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
MDSDesktopLayout >> renderSnackbarOn: html [
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
MDSDesktopLayout >> screenStyle [
	^ screenStyle
]

{ #category : #accessing }
MDSDesktopLayout >> screenStyle: anObject [
	screenStyle := anObject
]

{ #category : #accessing }
MDSDesktopLayout >> settingsView [
	^ settingsView
]

{ #category : #accessing }
MDSDesktopLayout >> settingsView: anObject [
	settingsView := anObject
]

{ #category : #testing }
MDSDesktopLayout >> sideNavVisible [

	^ self sideNav
		ifNil: [ false ]
		ifNotNil: [ :value |
			self isDesktopStyle or: [ self isTabletStyle and: [ value isDrawerOpen ] ] ]
]

{ #category : #testing }
MDSDesktopLayout >> sideSheetVisible [

	^ self sideSheet
		ifNil: [ false ]
		ifNotNil: [ :value | value isHidden not and: [ value component notNil ] ]
]

{ #category : #actions }
MDSDesktopLayout >> snackbarText [

	^ self app snackbarText
]

{ #category : #actions }
MDSDesktopLayout >> snackbarText: anObject [

	self app snackbarText: anObject
]
