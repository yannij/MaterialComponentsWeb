"
I am a layout for an medium sized screen (i.e. laptop). A persistent Drawer is used, and the Side Sheet appears beside the Body.
"
Class {
	#name : #MDSLayoutMedium,
	#superclass : #MDSLayout,
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSLayoutMedium >> cellSpan [

	^ 6
]

{ #category : #initialization }
MDSLayoutMedium >> initializeComplete [

	self sideNav bePersistentDrawer; beDismissed
]

{ #category : #rendering }
MDSLayoutMedium >> renderContentOn: html [

	self renderLayoutLaptopOn: html
]

{ #category : #rendering }
MDSLayoutMedium >> renderLayoutLaptopOn: html [

	html div class: self cssClass if: (self cssClass notNil); style: 'height: 100vh'; with: self sideNav.
	html render: self topAppBar.

	html div
		"style: 'max-width: 1920px';"
		mdcDrawerAppContent;
		with: [
			| div |
			div := html div.
			self mcwDenseView
				ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
				ifFalse: [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
			div
				style: 'float: left';
				style: 'overflow-x: auto';
				"mdcStyle: self contentAreaWidthCalc if: self sideSheetVisible;"
				class: 'mcw-layout-desktop';
				with: [ self renderContentToShowOn: html ] ]
]
