Class {
	#name : #MDSLayoutExampleApp,
	#superclass : #MDSApplication,
	#instVars : [
		'pages',
		'currentPage'
	],
	#category : #'Material-Demo-Web'
}

{ #category : #utilities }
MDSLayoutExampleApp class >> iconNames [

	^ OrderedCollection new
		add: 'waves';
		add: 'shield';
		add: 'policy';
		add: 'gesture';
		add: 'face';
		add: 'schedule';
		add: 'language';
		add: 'fingerprint';
		add: 'article';
		add: 'paid';
		add: 'lightbulb';
		add: 'history';
		add: 'assignment';
		add: 'build';
		yourself
]

{ #category : #utilities }
MDSLayoutExampleApp class >> loremIpsumEnglish [
	"Answer lorem ipsum in English to avoid Google translate popup in browser"

	^ 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.'
]

{ #category : #utilities }
MDSLayoutExampleApp class >> loremIpsumEnglish: size [
	"Copied from #loremIpsum: and adjusted"
	
	"self loremIpsumEnglish: 2048"
	
	| words out |
	words := (self loremIpsumEnglish findTokens: ' ,.') collect: [:each | each asLowercase].
	(out := LimitedWriteStream on: (String new: size))
		limit: size - 2;
		limitBlock: [
			^ out originalContents 
				at: size - 1 put: $.; 
				at: size put: Character cr; 
				yourself ].
	[ 
		out << self loremIpsumEnglish; cr; cr.
		5 atRandom timesRepeat: [
			15 atRandom timesRepeat: [
	 			out << words atRandom capitalized.
				20 atRandom timesRepeat: [ out space; << words atRandom ].
				out nextPut: $.; space ].
			out cr; cr ] ] repeat
]

{ #category : #accessing }
MDSLayoutExampleApp >> applicationTitle [

	self subclassResponsibility
]

{ #category : #rendering }
MDSLayoutExampleApp >> buildPages [
	| newPages |

	newPages := Dictionary new.

	1 to: 16 do: [ :i | | pageName |
		pageName := 'Page ', i printString.
		newPages
			at: pageName
			put: '** ', pageName, ' ** content ... ', (self class loremIpsumEnglish: 1024) ].

	^ newPages
]

{ #category : #accessing }
MDSLayoutExampleApp >> currentPage [

	^ currentPage
]

{ #category : #accessing }
MDSLayoutExampleApp >> currentPage: anObject [

	currentPage := anObject
]

{ #category : #accessing }
MDSLayoutExampleApp >> currentPageSet: anObject [
	"Subclass may enhance"

	self currentPage: anObject
]

{ #category : #initialization }
MDSLayoutExampleApp >> initialize [

	super initialize.

	self pages: self buildPages
]

{ #category : #accessing }
MDSLayoutExampleApp >> pages [

	^ pages
]

{ #category : #accessing }
MDSLayoutExampleApp >> pages: anObject [

	pages := anObject
]

{ #category : #rendering }
MDSLayoutExampleApp >> renderContentOn: html [

	html document addLoadScript: (JSStream on: 'mdc.autoInit()').

	html script with:
		'var bodyStyle = document.querySelector("body").style;'
		, 'bodyStyle.setProperty("--mdc-theme-primary", "#0088F0");'.

	self renderLayoutOn: html.

	self renderMaterialComponentsWebJsOn: html
]

{ #category : #rendering }
MDSLayoutExampleApp >> renderCurrentDisplayOn: html [

	html div
		style: 'width: 300px; margin: 24px auto';
		with: [
			html span
				mdcTypography_body2;
				with: 'Example layout application. ' ].

	html div
		style: 'width: 300px; margin: 20px auto';
		with: [
			html span
				mdcTypography_body2;
				with: (self pages at: self currentPage ifAbsent: [ 'None selected' ] ) ]
]

{ #category : #rendering }
MDSLayoutExampleApp >> renderLayoutOn: html [

	self subclassResponsibility
]

{ #category : #updating }
MDSLayoutExampleApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot link relationship: 'dns-prefetch'; url: '//fonts.googleapis.com'.
	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/css2?family=Material+Icons'.
	anHtmlRoot stylesheet url: 'https://fonts.googleapis.com/css2?family=Material+Icons+Outlined'.
	anHtmlRoot stylesheet url: MDSResponsiveAppLibrary / #responsiveAppCss.

	anHtmlRoot title: self applicationTitle.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		attributeAt: 'content' put: 'width=device-width, initial-scale=1'.

	anHtmlRoot bodyAttributes addClass: 'mcw-body'.
	anHtmlRoot bodyAttributes addClass: 'mdc-typography'
]
