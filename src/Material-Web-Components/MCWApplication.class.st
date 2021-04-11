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
MCWApplication class >> registerMaterialWebDeployment: aName [
	| app |

	WAAdmin applicationDefaults
		removeParent: WADevelopmentConfiguration instance.

	app := WAAdmin register: self asApplicationAt: aName.
	app
		addLibrary: JQDevelopmentLibrary;
		addLibrary: MCWDevelopmentLibrary;
		yourself.
	^ app
]

{ #category : #'instance creation' }
MCWApplication class >> registerMaterialWebDevelopment: aName [
	| app |

	WAAdmin applicationDefaults
		addParent: WADevelopmentConfiguration instance.

	app := WAAdmin register: self asApplicationAt: aName.
	app
		addLibrary: JQDevelopmentLibrary;
		addLibrary: MCWDevelopmentLibrary;
		yourself.
	^ app
]

{ #category : #accessing }
MCWApplication >> materialComponentsWebCssUrl [

	^ self materialVersion isNil
		ifTrue: [MCWDevelopmentLibrary / #materialcomponentswebCss]
		ifFalse: [ self materialComponentsWebUrlFragment, '.min.css']

]

{ #category : #accessing }
MCWApplication >> materialComponentsWebJsUrl [

	^ self materialVersion isNil
		ifTrue: [MCWDevelopmentLibrary / #materialcomponentswebJs]
		ifFalse: [ self materialComponentsWebUrlFragment, '.min.js']

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

	"anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Lora').
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Roboto+Mono').
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=Roboto:300,400,500')."
	"anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/icon?family=Material+Icons')."
	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/icon?family=Material+Icons'.

]

{ #category : #updating }
MCWApplication >> updateRootMaterialComponentsWebCss: anHtmlRoot [

	anHtmlRoot stylesheet url: self materialComponentsWebCssUrl
]
