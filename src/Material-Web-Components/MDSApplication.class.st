Class {
	#name : #MDSApplication,
	#superclass : #WAComponent,
	#instVars : [
		'materialVersion'
	],
	#category : #'Material-Web-Components'
}

{ #category : #testing }
MDSApplication class >> canBeRoot [
	^ true
]

{ #category : #'instance creation' }
MDSApplication class >> mcwRegisterDeployment: aName [
	| app |

	self environment at: #WADevelopmentConfiguration ifPresent: [ :class |
		WAAdmin applicationDefaults removeParent: WADevelopmentConfiguration instance ].

	app := WAAdmin register: self asApplicationAt: aName.
	app
		addLibrary: JQGoogleLibrary;
		addLibrary: MDSDevelopmentLibrary;
		yourself.
	^ app
]

{ #category : #'instance creation' }
MDSApplication class >> mcwRegisterDevelopment: aName [
	| app |

	self environment at: #WADevelopmentConfiguration ifPresent: [ :class |
		WAAdmin applicationDefaults addParent: WADevelopmentConfiguration instance ].

	app := WAAdmin register: self asApplicationAt: aName.
	app
		addLibrary: JQGoogleLibrary;
		addLibrary: MDSDevelopmentLibrary;
		yourself.
	^ app
]

{ #category : #logging }
MDSApplication >> logFormat: aFormatString with: aValue [

	self logString: (aFormatString format: (Array with: aValue))
]

{ #category : #logging }
MDSApplication >> logFormat: aFormatString with: aValue1 with: aValue2 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2))
]

{ #category : #logging }
MDSApplication >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3))
]

{ #category : #logging }
MDSApplication >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 with: aValue4 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3 with: aValue4))
]

{ #category : #logging }
MDSApplication >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 with: aValue4 with: aValue5 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3 with: aValue4 with: aValue5))
]

{ #category : #logging }
MDSApplication >> logString: aString [

	Transcript crShow: aString
]

{ #category : #accessing }
MDSApplication >> materialComponentsWebCssUrl [

	^ self materialVersion
		ifNil: [ MDSDevelopmentLibrary / #materialcomponentswebCss ]
		ifNotNil: [ :arg | self materialComponentsWebUrlFragment , '.min.css' ]
]

{ #category : #accessing }
MDSApplication >> materialComponentsWebJsUrl [

	^ self materialVersion
		ifNil: [ MDSDevelopmentLibrary / #materialcomponentswebJs ]
		ifNotNil: [ :arg | self materialComponentsWebUrlFragment , '.min.js' ]
]

{ #category : #accessing }
MDSApplication >> materialComponentsWebUrlFragment [
	| versionStirng |

	versionStirng := self materialVersion isEmpty
		ifTrue: [ 'latest' ]
		ifFalse: [ self materialVersion ].

	^ 'https://unpkg.com/material-components-web@<1s>/dist/material-components-web' expandMacrosWith: versionStirng
]

{ #category : #accessing }
MDSApplication >> materialVersion [
	^ materialVersion
]

{ #category : #initialization }
MDSApplication >> materialVersion10dot [
	"Use 10.0.0 unpkg.com"

	self materialVersion: '10.0.0'
]

{ #category : #initialization }
MDSApplication >> materialVersion13dot [
	"Use 13.0.0 unpkg.com"

	self materialVersion: '13.0.0'
]

{ #category : #accessing }
MDSApplication >> materialVersion: anObject [
	materialVersion := anObject
]

{ #category : #initialization }
MDSApplication >> materialVersionDefault [

	self materialVersionLocalServer
	"self materialVersion13dot"
]

{ #category : #initialization }
MDSApplication >> materialVersionLatest [
	"Use latest version from unpkg.com"

	self materialVersion: ''
]

{ #category : #initialization }
MDSApplication >> materialVersionLocalServer [
	"Use version served by Seaside"

	self materialVersion: nil
]

{ #category : #actions }
MDSApplication >> redirect [
	"we need to build the url we redirect to because we just expired the session in this test"
	| url |
	url := self application url.
	url addAllToPath: self requestContext consumer upToEnd.
	^ self requestContext responseGenerator
		redirectTo: url;
		respond
]

{ #category : #rendering }
MDSApplication >> renderMaterialComponentsWebJsOn: html [

	html script async; url: self materialComponentsWebJsUrl
]

{ #category : #updating }
MDSApplication >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	self updateRootMaterialComponentsWebCss: anHtmlRoot.
	anHtmlRoot beHtml5

]

{ #category : #updating }
MDSApplication >> updateRootFonts: anHtmlRoot [

	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/css2?family=Material+Icons'.
	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/css2?family=Material+Icons+Outlined'.

]

{ #category : #updating }
MDSApplication >> updateRootMaterialComponentsWebCss: anHtmlRoot [

	anHtmlRoot stylesheet url: self materialComponentsWebCssUrl
]
