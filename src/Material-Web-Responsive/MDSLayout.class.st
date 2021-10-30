"
I am an abstract class for layout of Top App Bar, Drawer, and Body components from Material Design
"
Class {
	#name : #MDSLayout,
	#superclass : #MDSComponent,
	#instVars : [
		'app',
		'topAppBar',
		'sideSheet',
		'bodyRegion',
		'sideNav',
		'settingsView'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSLayout class >> layoutExtraSmall [

	^ #'extra-small'
]

{ #category : #accessing }
MDSLayout class >> layoutLarge [

	^ #large
]

{ #category : #accessing }
MDSLayout class >> layoutMedium [

	^ #medium
]

{ #category : #accessing }
MDSLayout class >> layoutSmall [

	^ #small
]

{ #category : #'instance creation' }
MDSLayout class >> on: aResponsiveApp [

	^ self new initializeOn: aResponsiveApp; yourself
]

{ #category : #accessing }
MDSLayout >> app [
	^ app
]

{ #category : #accessing }
MDSLayout >> app: anObject [
	app := anObject
]

{ #category : #accessing }
MDSLayout >> bodyRegion [

	^ bodyRegion
]

{ #category : #accessing }
MDSLayout >> bodyRegion: anObject [

	bodyRegion := anObject
]

{ #category : #actions }
MDSLayout >> bodyRegionContent: aComponent [

	self bodyRegion component: aComponent
]

{ #category : #initialization }
MDSLayout >> buildBodyRegion [

	^ MDSBodyRegion new
		"component: (String loremIpsum: 5000);"
		yourself
]

{ #category : #initialization }
MDSLayout >> buildSideNav [

	^ (MDSDrawer content: nil "self buildList title: self applicationTitle")
		"title: 'Example';
		subtitle: 'Sub-example';"
		yourself
]

{ #category : #initialization }
MDSLayout >> buildSideSheet [

	^ MDSSideSheet new
]

{ #category : #initialization }
MDSLayout >> buildTopAppBar [
	"| settingsPopup |

	settingsPopup := self buildPopupMenuSettings."

	^ (MDSTopAppBar new "title: self applicationTitle")
		"startSectionAdd: self buildNavigationIcon;
		endSectionAdd: (MDSTopAppBarActionItem materialIcon: 'settings' onClickScript: settingsPopup openScript);
		endSectionAdd: settingsPopup;"
		yourself
]

{ #category : #accessing }
MDSLayout >> cssStyle: anObject [

	self cssClass: anObject
]

{ #category : #accessing }
MDSLayout >> densitySet: aDensityValue [

	self density: aDensityValue.

	self denseView
		ifTrue: [
			self sideNav fixedAdjustDense.
			self topAppBar denseOn ]
		ifFalse: [
			self sideNav fixedAdjustRegular.
			self topAppBar denseOff ]
]

{ #category : #initialization }
MDSLayout >> initialize [

	super initialize.

	"self settingsView: MDMApplicationSettingsView new."
	self topAppBar: self buildTopAppBar.
	self sideNav: self buildSideNav.
	self bodyRegion: self buildBodyRegion.
	self sideSheet: self buildSideSheet
]

{ #category : #initialization }
MDSLayout >> initializeComplete [
	"Hook to do additional set up, just before the new receiver is returned"
]

{ #category : #initialization }
MDSLayout >> initializeOn: anApplication [

	self app: anApplication
]

{ #category : #rendering }
MDSLayout >> renderContentOn: html [

	self subclassResponsibility
]

{ #category : #rendering }
MDSLayout >> renderContentToShowOn: html [

	self renderSnackbarOn: html.

	self sideSheetVisible ifFalse: [
		"self renderBannerDesktopOn: html."
		html render: self bodyRegion.
		^ self ].

	html div mdcLayoutGrid; style: 'padding: 0px'; with: [
		html div mdcLayoutGrid__inner; style: 'grid-gap: 0px'; with: [
			"html div
				mdcLayoutGrid__cell_span12;
				with: [
					self renderBannerDesktopOn: html ]"
			html div
				mdcLayoutGrid__cell;
				mdcLayoutGrid__cell_span10Desktop;
				mdcLayoutGrid__cell_span6Tablet;
				mdcLayoutGrid__cell_span4Phone;
				with: [
					html render: self bodyRegion ].
			html div
				mdcLayoutGrid__cell;
				mdcLayoutGrid__cell_span2Desktop;
				mdcLayoutGrid__cell_span2Tablet;
				mdcLayoutGrid__cell_span4Phone;
				with: [ html render: self sideSheet ] ] ]
]

{ #category : #rendering }
MDSLayout >> renderSnackbarOn: html [
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
MDSLayout >> settingsView [
	^ settingsView
]

{ #category : #accessing }
MDSLayout >> settingsView: anObject [
	settingsView := anObject
]

{ #category : #accessing }
MDSLayout >> sideNav [

	^ sideNav
]

{ #category : #accessing }
MDSLayout >> sideNav: anObject [

	sideNav := anObject
]

{ #category : #actions }
MDSLayout >> sideNavContent: aComponent [

	self sideNav content: aComponent
]

{ #category : #actions }
MDSLayout >> sideNavDismissIfModal [

	self sideNav ifNotNil: [ :value | value dismissIfModel ]
]

{ #category : #actions }
MDSLayout >> sideNavOpenToggle [

	self sideNav ifNotNil: [ :value | value drawerOpenToggle ]
]

{ #category : #accessing }
MDSLayout >> sideSheet [

	^ sideSheet
]

{ #category : #accessing }
MDSLayout >> sideSheet: anObject [

	sideSheet := anObject
]

{ #category : #actions }
MDSLayout >> sideSheetContent: aComponent [

	self sideSheet component: aComponent
]

{ #category : #actions }
MDSLayout >> sideSheetHiddenToggle [

	self sideSheet ifNotNil: [ :value | value toggleHiddenValue ]
]

{ #category : #actions }
MDSLayout >> sideSheetHide [

	self sideSheet ifNotNil: [ :value | value beHidden ]
]

{ #category : #actions }
MDSLayout >> sideSheetUnhide [

	self sideSheet ifNotNil: [ :value | value beUnHidden ]
]

{ #category : #testing }
MDSLayout >> sideSheetVisible [

	^ self sideSheet
		ifNil: [ false ]
		ifNotNil: [ :value | value isHidden not and: [ value component notNil ] ]
]

{ #category : #accessing }
MDSLayout >> snackbarText [

	^ self app snackbarText
]

{ #category : #accessing }
MDSLayout >> snackbarText: anObject [

	self app snackbarText: anObject
]

{ #category : #actions }
MDSLayout >> topAappBarCollapsedToggle [

	self sideSheet ifNotNil: [ :value | value shortCollapsedToggle ]
]

{ #category : #accessing }
MDSLayout >> topAppBar [

	^ topAppBar
]

{ #category : #accessing }
MDSLayout >> topAppBar: anObject [

	topAppBar := anObject
]

{ #category : #actions }
MDSLayout >> topAppBarTitle: aString [

	self topAppBar title: aString
]
