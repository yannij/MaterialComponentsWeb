Class {
	#name : #MDSBasicResponsiveLibrary,
	#superclass : #WAFileLibrary,
	#category : #'Material-Web-Demo'
}

{ #category : #uploaded }
MDSBasicResponsiveLibrary >> appCss [

	^ '
body {
    margin: 0
}
'
]

{ #category : #accessing }
MDSBasicResponsiveLibrary >> selectorsToInclude [

	^ #(appCss)
]
