Class {
	#name : #QuasarApplication,
	#superclass : #WAComponent,
	#instVars : [
		'quasarVersion',
		'colorTheme',
		'quasarData',
		'vueRefs'
	],
	#category : #'Quasar-Components'
}

{ #category : #testing }
QuasarApplication class >> canBeRoot [
	^ true
]

{ #category : #'instance creation' }
QuasarApplication class >> mdqRegisterDeployment: aName [
	| app |

	self environment at: #WADevelopmentConfiguration ifPresent: [ :class |
		WAAdmin applicationDefaults removeParent: WADevelopmentConfiguration instance ].

	app := WAAdmin register: self asApplicationAt: aName.
	app
		addLibrary: JQGoogleLibrary;
		yourself.
	^ app
]

{ #category : #accessing }
QuasarApplication >> applicationTitle [

	self subclassResponsibility
]

{ #category : #accessing }
QuasarApplication >> colorTheme [

	^ colorTheme
]

{ #category : #accessing }
QuasarApplication >> colorTheme: anObject [

	colorTheme := anObject
]

{ #category : #accessing }
QuasarApplication >> faviconUrl [
	"Subclasses should override"

	^ '/files/WAToolFiles/help.png'
]

{ #category : #initialization }
QuasarApplication >> initialize [

	super initialize.

	self vueRefsClear.
	self quasarDataClear
]

{ #category : #login }
QuasarApplication >> isLoggedIn [

	^ self loginComponent notNil and: [ self loginComponent isLoggedIn ]
]

{ #category : #accessing }
QuasarApplication >> jsdelivrUrlFragment [

	^ 'https://cdn.jsdelivr.net/npm/quasar@<1s>/dist/' expandMacrosWith: self quasarVersionLazy
]

{ #category : #logging }
QuasarApplication >> logFormat: aFormatString with: aValue [

	self logString: (aFormatString format: (Array with: aValue))
]

{ #category : #logging }
QuasarApplication >> logFormat: aFormatString with: aValue1 with: aValue2 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2))
]

{ #category : #logging }
QuasarApplication >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3))
]

{ #category : #logging }
QuasarApplication >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 with: aValue4 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3 with: aValue4))
]

{ #category : #logging }
QuasarApplication >> logFormat: aFormatString with: aValue1 with: aValue2 with: aValue3 with: aValue4 with: aValue5 [

	self logString: (aFormatString format: (Array with: aValue1 with: aValue2 with: aValue3 with: aValue4 with: aValue5))
]

{ #category : #logging }
QuasarApplication >> logString: aString [

	Transcript crShow: aString
]

{ #category : #login }
QuasarApplication >> logout [

	self loginComponent
		ifNotNil: [ :component |
			component loggedOut ]
		ifNil: [
			self session ifNotNil: [ :value | value unregister ].
			self redirect ]
]

{ #category : #accessing }
QuasarApplication >> quasarCssUrl [

	^ self jsdelivrUrlFragment, 'quasar.rtl.prod.css'
]

{ #category : #accessing }
QuasarApplication >> quasarData [

	^ quasarData
]

{ #category : #accessing }
QuasarApplication >> quasarData: anObject [

	quasarData := anObject
]

{ #category : #accessing }
QuasarApplication >> quasarDataAdd: anObject [

	self quasarData addIfNotPresent: anObject
]

{ #category : #accessing }
QuasarApplication >> quasarDataClear [

	self quasarData: OrderedCollection new
]

{ #category : #accessing }
QuasarApplication >> quasarDataRemove: anObject [

	self quasarData remove: anObject ifAbsent: [ nil ]
]

{ #category : #accessing }
QuasarApplication >> quasarJsUrl [

	^ self jsdelivrUrlFragment, 'quasar.umd.prod.js'
]

{ #category : #accessing }
QuasarApplication >> quasarVersion [

	^ quasarVersion
]

{ #category : #accessing }
QuasarApplication >> quasarVersion: anObject [

	quasarVersion := anObject
]

{ #category : #accessing }
QuasarApplication >> quasarVersionLazy [

	self quasarVersion ifNil: [ self quasarVersion: '2.4.9' ].

	^ self quasarVersion
]

{ #category : #actions }
QuasarApplication >> redirect [
	"we need to build the url we redirect to because we just expired the session in this test"
	| url |
	url := self application url.
	url addAllToPath: self requestContext consumer upToEnd.
	^ self requestContext responseGenerator
		redirectTo: url;
		respond
]

{ #category : #rendering }
QuasarApplication >> renderContentOn: html [

	self renderLayoutOn: html.

	self renderQuasarJsOn: html.
	self renderQuasarSetupOn: html
]

{ #category : #rendering }
QuasarApplication >> renderLayoutOn: html [

	self subclassResponsibility
]

{ #category : #rendering }
QuasarApplication >> renderQuasarJsOn: html [

	html script "async;" url: self vueJsUrl.
	html script "async;" url: self quasarJsUrl
]

{ #category : #rendering }
QuasarApplication >> renderQuasarSetupOn: html [

	html document addLoadScript: (JSStream on:
'const { ref } = Vue
const app = Vue.createApp({
	setup () {
		return {}
	}
})
app.use(Quasar)
app.mount(''q-app'')')
]

{ #category : #rendering }
QuasarApplication >> renderSetColorTheme: aColorTheme on: html [

	aColorTheme ifNil: [ ^ self ].

	aColorTheme colors ifNotNil: [ :colors | | stream |
		stream := WriteStream on: String new.
		stream nextPutAll: 'var bodyStyle = document.querySelector(":root").style;'.
		colors keysAndValuesDo: [ :eachKey :eachValue |
			stream
				nextPutAll: 'bodyStyle.setProperty("--q-', eachKey, '", "', eachValue "asHexString", '");';
				yourself ].

		html script: stream contents ]
]

{ #category : #updating }
QuasarApplication >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	self updateRootFonts: anHtmlRoot.
	self updateRootQuasarCss: anHtmlRoot.

	anHtmlRoot stylesheet url: (QuasarApplicationLibrary urlOf: #qAppCss).
	anHtmlRoot link beShortcutIcon; url: self faviconUrl.
	anHtmlRoot title: self applicationTitle.
	anHtmlRoot beHtml5

]

{ #category : #updating }
QuasarApplication >> updateRootFonts: anHtmlRoot [

	anHtmlRoot stylesheet
		url: 'https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons|Material+Icons+Outlined'.

]

{ #category : #updating }
QuasarApplication >> updateRootQuasarCss: anHtmlRoot [

	anHtmlRoot stylesheet url: self quasarCssUrl
]

{ #category : #accessing }
QuasarApplication >> vueJsUrl [

	^ 'https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.prod.js'
]

{ #category : #accessing }
QuasarApplication >> vueRefs [

	^ vueRefs
]

{ #category : #accessing }
QuasarApplication >> vueRefs: anObject [

	vueRefs := anObject
]

{ #category : #accessing }
QuasarApplication >> vueRefsAdd: anObject [

	self vueRefs at: anObject key put: anObject value
]

{ #category : #accessing }
QuasarApplication >> vueRefsClear [

	self vueRefs: Dictionary new
]

{ #category : #accessing }
QuasarApplication >> vueRefsRemove: anObject [

	self vueRefs remove: anObject ifAbsent: [ nil ]
]
