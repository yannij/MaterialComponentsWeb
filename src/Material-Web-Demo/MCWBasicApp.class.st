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

	html document addLoadScript: (JSScript new add: (JSStream new nextPutAll: 'mdc.autoInit()'); yourself).

	html script with:
		'var bodyStyle = document.querySelector("body").style;'
		, 'bodyStyle.setProperty("--mdc-theme-primary", "#0088F0");'.

	self renderLayoutOn: html.

	self renderMaterialComponentsWebJsOn: html
]

{ #category : #rendering }
MCWBasicApp >> renderLayoutOn: html [
	| topAppBar |

	topAppBar := MCWTopAppBar new
		toolbarTitle: (MCWTopAppBarTtile titled: 'Hello World!');
		yourself.

	html div
		with: [
			html render: topAppBar.
			html div
				mdcTopAppBar_fixedAdjust;
				with: [
					html div
						style: 'width: 250px; margin: 20px auto';
						with: [
							html span
								mdcTypography_body2;
								with: 'Start your application here, to not have Magritte dependency' ] ] ]
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
