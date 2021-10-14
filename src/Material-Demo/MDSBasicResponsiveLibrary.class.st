Class {
	#name : #MDSBasicResponsiveLibrary,
	#superclass : #WAFileLibrary,
	#category : #'Material-Demo-Web'
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
