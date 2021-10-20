Class {
	#name : #MDSBrowseAllDemosApp,
	#superclass : #MDSApplication,
	#category : #'Material-Demo-Browse'
}

{ #category : #initialization }
MDSBrowseAllDemosApp class >> applicationPath [

	^ 'mds-browse'
]

{ #category : #initialization }
MDSBrowseAllDemosApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath

]

{ #category : #accessing }
MDSBrowseAllDemosApp >> applicationTitle [

	^ 'Material Design Seaside - Browse Demos'
]

{ #category : #rendering }
MDSBrowseAllDemosApp >> demoClasses [

	^ #(
	MDSAutoResponsiveApp
	MDSBasicResponsiveApp
	ShrineApp
	RallyApp
	MDSComponentDemoApp
	MDSDrawerNavigationApp
	MDSTabNavigationApp
	MDSHelloWorldApp
	)
	collect: [ :eachApp | eachApp asClassInEnvironment: Smalltalk globals ifAbsent: [ nil ] ]
]

{ #category : #rendering }
MDSBrowseAllDemosApp >> renderAppInfo: anAppClass on: html [
	| url |

	url := WAUrl absolute: anAppClass applicationPath.

	html div "style: 'width: 450px';" with: [
		html text: anAppClass name asString, ' - '.
		html anchor attributeAt: 'href' put: url; with: url.
		html break; break.
		html text: anAppClass organization classComment].

	html div "style: 'width: 250px';" with: [
		(anAppClass class canUnderstand: #snapshotUrl) ifTrue: [
			html image
				"width: '100%'; height: '100%';"
				url: (anAppClass class soleInstance perform: #snapshotUrl) ] ]
]

{ #category : #rendering }
MDSBrowseAllDemosApp >> renderContentOn: html [

	html document addLoadScript: (JSStream on: 'mdc.autoInit()').

	html script with:
		'var bodyStyle = document.querySelector("body").style;'
		, 'bodyStyle.setProperty("--mdc-theme-primary", "#0088F0");'.

	html div with: [
		self renderTopAppBarOn: html.
		self renderLayoutOn: html ].

	self renderMaterialComponentsWebJsOn: html
]

{ #category : #rendering }
MDSBrowseAllDemosApp >> renderDemoInfoOn: html [

	(self demoClasses select: [ :eachClass | eachClass notNil ])
		do: [ :eachClass | self renderAppInfo: eachClass on: html ]
		separatedBy: [ html horizontalRule ]
]

{ #category : #rendering }
MDSBrowseAllDemosApp >> renderLayoutOn: html [

	html div mdcTopAppBar_fixedAdjust; with: [
		html div style: 'width: 600px; margin: 20px auto'; with: [
			self renderDemoInfoOn: html ] ]
]

{ #category : #rendering }
MDSBrowseAllDemosApp >> renderTopAppBarOn: html [
	| tag |

	tag := html header mdcTopAppBar.

	tag
		mdcAutoInit: 'MDCTopAppBar';
		with: [
			html div mdcTopAppBar__row; with: [
				html section
					mdcTopAppBar__section; mdcTopAppBar__section_alignStart;
					with: [
						html span mdcTopAppBar__title; with: self applicationTitle ] ] ]
]

{ #category : #updating }
MDSBrowseAllDemosApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot link relationship: 'dns-prefetch'; url: '//fonts.googleapis.com'.
	anHtmlRoot stylesheet url: (MDSHelloWorldLibrary urlOf: #appCss).

	anHtmlRoot title: self applicationTitle.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		attributeAt: 'content' put: 'width=device-width, initial-scale=1'.

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
