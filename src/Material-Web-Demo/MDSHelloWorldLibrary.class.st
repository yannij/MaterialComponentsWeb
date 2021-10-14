Class {
	#name : #MDSHelloWorldLibrary,
	#superclass : #WAFileLibrary,
	#category : #'Material-Web-Demo'
}

{ #category : #uploaded }
MDSHelloWorldLibrary >> appCss [

	^ '
body {
    margin: 0
}
'
]

{ #category : #accessing }
MDSHelloWorldLibrary >> selectorsToInclude [

	^ #(appCss)
]
