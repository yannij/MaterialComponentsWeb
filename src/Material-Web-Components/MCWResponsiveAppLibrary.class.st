Class {
	#name : #MCWResponsiveAppLibrary,
	#superclass : #WAFileLibrary,
	#category : 'Material-Web-Components'
}

{ #category : #uploaded }
MCWResponsiveAppLibrary >> responsiveAppCss [

	^'
.mcw-layout-mobile .mdc-fab {
}

.mcw-layout-tablet .mdc-fab {
	top: 96px;
	left: 1rem;
}

.mcw-layout-desktop .mdc-fab {
	top: 96px;
	left: 0rem;
}

.appBarPadding {
	padding-top: 56px;
}
'
]
