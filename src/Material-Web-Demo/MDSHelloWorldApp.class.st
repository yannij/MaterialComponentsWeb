Class {
	#name : #MDSHelloWorldApp,
	#superclass : #MDSApplication,
	#category : #'Material-Web-Demo'
}

{ #category : #initialization }
MDSHelloWorldApp class >> applicationPath [

	^ 'material/hello-world'
]

{ #category : #initialization }
MDSHelloWorldApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath

]

{ #category : #accessing }
MDSHelloWorldApp >> applicationTitle [

	^ 'Hello World Example'
]

{ #category : #rendering }
MDSHelloWorldApp >> renderContentOn: html [

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
MDSHelloWorldApp >> renderLayoutOn: html [

	html div mdcTopAppBar_fixedAdjust; with: [
		html div
			style: 'width: 250px; margin: 20px auto';
			with: [
				html span
					mdcTypography_body2;
					with: 'Start your application here, to use Material Components directly' ] ]
]

{ #category : #rendering }
MDSHelloWorldApp >> renderTopAppBarOn: html [
	| tag |

	tag := html header mdcTopAppBar.

	tag
		mdcAutoInit: 'MDCTopAppBar';
		with: [
			html div mdcTopAppBar__row; with: [
				html section
					mdcTopAppBar__section; mdcTopAppBar__section_alignStart;
					with: [
						html span mdcTopAppBar__title; with: 'Hello world!' ] ] ]
]

{ #category : #updating }
MDSHelloWorldApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot link relationship: 'dns-prefetch'; url: '//fonts.googleapis.com'.
	anHtmlRoot stylesheet url: (MDSHelloWorldLibrary urlOf: #appCss).

	anHtmlRoot title: self applicationTitle.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		attributeAt: 'content' put: 'width=device-width, initial-scale=1'.

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
