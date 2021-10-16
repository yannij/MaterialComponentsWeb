Class {
	#name : #MDSResponsiveApp,
	#superclass : #MDSApplication,
	#instVars : [
		'topAppBar',
		'sideSheet',
		'bodyRegion',
		'layout',
		'sideNav'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSResponsiveApp >> applicationTitle [

	self subclassResponsibility
]

{ #category : #accessing }
MDSResponsiveApp >> bodyRegion [

	^ bodyRegion
]

{ #category : #accessing }
MDSResponsiveApp >> bodyRegion: anObject [

	bodyRegion := anObject
]

{ #category : #initialization }
MDSResponsiveApp >> buildNavigationIcon [

	^ MDSTopAppBarNavigationIcon materialIcon: 'menu' callback: [ self sideNav drawerOpenToggle ]
]

{ #category : #accessing }
MDSResponsiveApp >> contentArea [

	^ bodyRegion
]

{ #category : #accessing }
MDSResponsiveApp >> denseView [

	^ self layout denseView
]

{ #category : #accessing }
MDSResponsiveApp >> layout [

	^ layout
]

{ #category : #accessing }
MDSResponsiveApp >> layout: anObject [

	layout := anObject
]

{ #category : #testing }
MDSResponsiveApp >> mcwIsResponsiveApplication [

	^ true
]

{ #category : #rendering }
MDSResponsiveApp >> renderContentOn: html [

	html document addLoadScript: (JSStream on: 'mdc.autoInit()').

	self renderLayoutOn: html.

	self renderMaterialComponentsWebJsOn: html
]

{ #category : #rendering }
MDSResponsiveApp >> renderLayoutOn: html [

	self subclassResponsibility
]

{ #category : #accessing }
MDSResponsiveApp >> sideNav [

	^ sideNav
]

{ #category : #accessing }
MDSResponsiveApp >> sideNav: anObject [

	sideNav := anObject
]

{ #category : #accessing }
MDSResponsiveApp >> sideSheet [

	^ sideSheet
]

{ #category : #accessing }
MDSResponsiveApp >> sideSheet: anObject [

	sideSheet := anObject
]

{ #category : #accessing }
MDSResponsiveApp >> snackbarText [
	"TODO: added to be compatible with MCW layout class"

	^ nil
]

{ #category : #accessing }
MDSResponsiveApp >> topAppBar [

	^ topAppBar
]

{ #category : #accessing }
MDSResponsiveApp >> topAppBar: anObject [

	topAppBar := anObject
]

{ #category : #updating }
MDSResponsiveApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot link relationship: 'dns-prefetch'; url: '//fonts.googleapis.com'.

	self updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: MDSResponsiveAppLibrary / #responsiveAppCss.

	anHtmlRoot title: self applicationTitle.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		attributeAt: 'content' put: 'width=device-width, initial-scale=1'.

	"anHtmlRoot bodyAttributes at: 'dir' append: 'rtl'."


	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.
	anHtmlRoot bodyAttributes addClass: 'mcw-body'
]
