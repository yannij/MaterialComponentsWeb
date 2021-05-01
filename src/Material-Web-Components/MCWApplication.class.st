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

{ #category : #'docker secrets' }
MCWApplication class >> dockerSecrets [
	"Subclasses may override #dockerSecretsFile, and use this method to retrieve the secrets"

	^ self dockerSecretsFile
		ifNil: [ nil ]
		ifNotNil: [ :value |
			| secretsFile |
			secretsFile := SmalltalkImage current imageDirectory / value.
			secretsFile exists
				ifFalse: [ secretsFile := FileSystem root / 'run' / 'secrets' / value ].	
			WAJsonParser parse: secretsFile contents ]
]

{ #category : #'docker secrets' }
MCWApplication class >> dockerSecretsCache [
	"Subclasses may override to cache result from #dockerSecrets"

	^ nil
]

{ #category : #'docker secrets' }
MCWApplication class >> dockerSecretsFile [
	"Subclasses may override"

	^ nil
]

{ #category : #'docker secrets' }
MCWApplication class >> installDockerSecrets [

	(self allSubclasses select: [ :eachClass | eachClass class methodDictionary includesKey: #dockerSecretsFile])
		do: [ :eachRoot | eachRoot dockerSecretsCache ].
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
