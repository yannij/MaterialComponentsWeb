Class {
	#name : #MDSLayout,
	#superclass : #MDSComponent,
	#instVars : [
		'app',
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
MDSLayout >> contentArea [

	^ self app contentArea
]

{ #category : #rendering }
MDSLayout >> contentToShow [

	^ self settingsView isHidden
		ifTrue: [ self contentArea ]
		ifFalse: [ self settingsView ]
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

	self settingsView: MDMApplicationSettingsView new.
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

	^ self app sideNav
]

{ #category : #accessing }
MDSLayout >> sideSheet [

	^ self app sideSheet
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

{ #category : #accessing }
MDSLayout >> topAappBarCollapsedToggle [

	self topAppBar shortCollapsedToggle
]

{ #category : #accessing }
MDSLayout >> topAppBar [

	^ self app topAppBar
]
