Class {
	#name : #MCWBasicResponsiveLibrary,
	#superclass : #WAFileLibrary,
	#instVars : [
		'colorThemeCss'
	],
	#category : #'Material-Web-Demo'
}

{ #category : #uploaded }
MCWBasicResponsiveLibrary >> appCss [

	^ '
body {
    margin: 0
}
'
]

{ #category : #accessing }
MCWBasicResponsiveLibrary >> selectorsToInclude [

	^ #(appCss)
]
