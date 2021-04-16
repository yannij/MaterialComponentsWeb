Class {
	#name : #MCWBasicLibrary,
	#superclass : #WAFileLibrary,
	#instVars : [
		'colorThemeCss'
	],
	#category : #'Material-Web-Demo'
}

{ #category : #uploaded }
MCWBasicLibrary >> appCss [

	^ '
body {
    margin: 0
}
'
]

{ #category : #accessing }
MCWBasicLibrary >> selectorsToInclude [

	^ #(appCss)
]
