Class {
	#name : #MDSResponsiveApp,
	#superclass : #MDSApplication,
	#instVars : [
		'layout'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSResponsiveApp >> applicationTitle [

	self subclassResponsibility
]

{ #category : #accessing }
MDSResponsiveApp >> bodyRegion [

	^ self layout bodyRegion
]

{ #category : #login }
MDSResponsiveApp >> buildLoginComponent [
	"Subclasses may override"
]

{ #category : #initialization }
MDSResponsiveApp >> buildNavigationIcon [

	^ MDSTopAppBarNavigationIcon materialIcon: 'menu' callback: [ self layout sideNavOpenToggle ]
]

{ #category : #accessing }
MDSResponsiveApp >> denseView [

	^ self layout denseView
]

{ #category : #login }
MDSResponsiveApp >> isLoggedIn [

	^ self loginComponent notNil and: [ self loginComponent isLoggedIn ]
]

{ #category : #accessing }
MDSResponsiveApp >> layout [

	^ layout
]

{ #category : #accessing }
MDSResponsiveApp >> layout: anObject [

	layout := anObject
]

{ #category : #login }
MDSResponsiveApp >> login [

	self loginComponent
		ifNil: [
			self loginComponent: self buildLoginComponent.
			self redirectToLogin ]
]

{ #category : #login }
MDSResponsiveApp >> loginComponent [
	"Subclasses may override"

	^ nil
]

{ #category : #login }
MDSResponsiveApp >> loginComponent: ignore [
	"Subclasses may override"
]

{ #category : #login }
MDSResponsiveApp >> logout [

	self loginComponent
		ifNotNil: [ :component |
			component loggedOut ]
		ifNil: [
			self session ifNotNil: [ :value | value unregister ].
			self redirect ]
]

{ #category : #testing }
MDSResponsiveApp >> mcwIsResponsiveApplication [

	^ true
]

{ #category : #login }
MDSResponsiveApp >> redirectToLogin [

	| url |
	url := self application url.
	url addAllToPath: self requestContext consumer upToEnd.
	url addToPath: 'login'.
	^ self requestContext responseGenerator
		redirectTo: url;
		respond
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

{ #category : #rendering }
MDSResponsiveApp >> renderSetColorTheme: aColorTheme on: html [
	| stream |

	stream := WriteStream on: String new.

	stream nextPutAll: 'var bodyStyle = document.querySelector(":root").style;'.
	aColorTheme keysAndValuesDo: [ :eachKey :eachValue |
		stream
			nextPutAll: 'bodyStyle.setProperty("--mdc-theme-', eachKey, '", "#', eachValue "asHexString", '");';
			yourself ].

	html script: stream contents
]

{ #category : #rendering }
MDSResponsiveApp >> renderSetTypographyFont: aFontFamily on: html [

	html script:
		'document.querySelector("body").style.setProperty("--mdc-typography-font-family", "', aFontFamily, '")'
]

{ #category : #accessing }
MDSResponsiveApp >> sideNav [

	^ self layout sideNav
]

{ #category : #accessing }
MDSResponsiveApp >> sideSheet [

	^ self layout sideSheet
]

{ #category : #accessing }
MDSResponsiveApp >> snackbarText [
	"TODO: added to be compatible with MCW layout class"

	^ nil
]

{ #category : #accessing }
MDSResponsiveApp >> topAppBar [

	^ self layout topAppBar
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
