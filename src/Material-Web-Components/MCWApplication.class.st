Class {
	#name : #MCWApplication,
	#superclass : #MCWComponent,
	#instVars : [
		'materialVersion'
	],
	#category : #'Material-Web-Components'
}

{ #category : #testing }
MCWApplication class >> canBeRoot [
	^ true
]

{ #category : #'instance creation' }
MCWApplication class >> mcwRegisterDeployment: aName [
	| app |

	self environment at: #WADevelopmentConfiguration ifPresent: [ :class |
		WAAdmin applicationDefaults removeParent: WADevelopmentConfiguration instance ].

	app := WAAdmin register: self asApplicationAt: aName.
	app
		addLibrary: JQDevelopmentLibrary;
		addLibrary: MCWDevelopmentLibrary;
		yourself.
	^ app
]

{ #category : #'instance creation' }
MCWApplication class >> mcwRegisterDevelopment: aName [
	| app |

	self environment at: #WADevelopmentConfiguration ifPresent: [ :class |
		WAAdmin applicationDefaults addParent: WADevelopmentConfiguration instance ].

	app := WAAdmin register: self asApplicationAt: aName.
	app
		addLibrary: JQDevelopmentLibrary;
		addLibrary: MCWDevelopmentLibrary;
		yourself.
	^ app
]

{ #category : #logging }
MCWApplication >> logFormat: aFormatString with: aValue [

	self logString: (aFormatString format: (Array with: aValue))
]

{ #category : #logging }
MCWApplication >> logFormat: aFormatString with: aValue1 with: aValue2 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2))
]

{ #category : #logging }
MCWApplication >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3))
]

{ #category : #logging }
MCWApplication >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 with: aValue4 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3 with: aValue4))
]

{ #category : #logging }
MCWApplication >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 with: aValue4 with: aValue5 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3 with: aValue4 with: aValue5))
]

{ #category : #logging }
MCWApplication >> logString: aString [

	Transcript crShow: aString
]

{ #category : #accessing }
MCWApplication >> materialComponentsWebCssUrl [

	^ self materialVersion
		ifNil: [ MCWDevelopmentLibrary / #materialcomponentswebCss ]
		ifNotNil: [ :arg | self materialComponentsWebUrlFragment , '.min.css' ]
]

{ #category : #accessing }
MCWApplication >> materialComponentsWebJsUrl [

	^ self materialVersion
		ifNil: [ MCWDevelopmentLibrary / #materialcomponentswebJs ]
		ifNotNil: [ :arg | self materialComponentsWebUrlFragment , '.min.js' ]
]

{ #category : #accessing }
MCWApplication >> materialComponentsWebUrlFragment [
	| versionStirng |

	versionStirng := self materialVersion isEmpty
		ifTrue: [ 'latest' ]
		ifFalse: [ self materialVersion ].

	^ 'https://unpkg.com/material-components-web@<1s>/dist/material-components-web' expandMacrosWith: versionStirng
]

{ #category : #accessing }
MCWApplication >> materialVersion [
	^ materialVersion
]

{ #category : #accessing }
MCWApplication >> materialVersion: anObject [
	materialVersion := anObject
]

{ #category : #actions }
MCWApplication >> redirect [
	"we need to build the url we redirect to because we just expired the session in this test"
	| url |
	url := self application url.
	url addAllToPath: self requestContext consumer upToEnd.
	^ self requestContext responseGenerator
		redirectTo: url;
		respond
]

{ #category : #rendering }
MCWApplication >> renderMaterialComponentsWebJsOn: html [

	html script async; url: self materialComponentsWebJsUrl
]

{ #category : #updating }
MCWApplication >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	self updateRootMaterialComponentsWebCss: anHtmlRoot.
	anHtmlRoot beHtml5

]

{ #category : #updating }
MCWApplication >> updateRootFonts: anHtmlRoot [

	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/css2?family=Material+Icons'.
	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/css2?family=Material+Icons+Outlined'.

]

{ #category : #updating }
MCWApplication >> updateRootMaterialComponentsWebCss: anHtmlRoot [

	anHtmlRoot stylesheet url: self materialComponentsWebCssUrl
]
