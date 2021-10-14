Class {
	#name : #MDSApplication,
	#superclass : #MDSComponent,
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
		addLibrary: JQDevelopmentLibrary;
		addLibrary: MCWDevelopmentLibrary;
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
		addLibrary: JQDevelopmentLibrary;
		addLibrary: MCWDevelopmentLibrary;
		yourself.
	^ app
]

{ #category : #accessing }
MDSApplication >> materialComponentsWebCssUrl [

	^ self materialVersion
		ifNil: [ MCWDevelopmentLibrary / #materialcomponentswebCss ]
		ifNotNil: [ :arg | self materialComponentsWebUrlFragment , '.min.css' ]
]

{ #category : #accessing }
MDSApplication >> materialComponentsWebJsUrl [

	^ self materialVersion
		ifNil: [ MCWDevelopmentLibrary / #materialcomponentswebJs ]
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

{ #category : #accessing }
MDSApplication >> materialVersion: anObject [
	materialVersion := anObject
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
