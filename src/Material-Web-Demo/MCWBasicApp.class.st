Class {
	#name : #MCWBasicApp,
	#superclass : #MCWApplication,
	#category : #'Material-Web-Demo'
}

{ #category : #initialization }
MCWBasicApp class >> applicationPath [

	^ 'material/basic'
]

{ #category : #initialization }
MCWBasicApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath

]

{ #category : #accessing }
MCWBasicApp >> applicationTitle [

	^ 'Basic Example'
]

{ #category : #rendering }
MCWBasicApp >> renderContentOn: html [

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
MCWBasicApp >> renderLayoutOn: html [

	html div mdcTopAppBar_fixedAdjust; with: [
		html div
			style: 'width: 250px; margin: 20px auto';
			with: [
				html span
					mdcTypography_body2;
					with: 'Start your application here, to use Material Components directly' ] ]
]

{ #category : #rendering }
MCWBasicApp >> renderTopAppBarOn: html [
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
MCWBasicApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot link relationship: 'dns-prefetch'; url: '//fonts.googleapis.com'.
	anHtmlRoot stylesheet url: (MCWBasicLibrary urlOf: #appCss).

	anHtmlRoot title: self applicationTitle.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		attributeAt: 'content' put: 'width=device-width, initial-scale=1'.

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
