Class {
	#name : #MDSResponsiveApp,
	#superclass : #MDSApplication,
	#category : #'Material-Web-Components'
}

{ #category : #accessing }
MDSResponsiveApp >> applicationTitle [

	self subclassResponsibility
]

{ #category : #updating }
MDSResponsiveApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot link relationship: 'dns-prefetch'; url: '//fonts.googleapis.com'.

	self updateRootFonts: anHtmlRoot.

	anHtmlRoot stylesheet url: MDSResponsiveAppLibrary / #responsiveAppCss.

	anHtmlRoot title: self applicationTitle.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		attributeAt: 'content' put: 'width=device-width, initial-scale=1'.

	"anHtmlRoot bodyAttributes at: 'dir' append: 'rtl'."

	anHtmlRoot bodyAttributes addClass: 'mcw-body'
]
