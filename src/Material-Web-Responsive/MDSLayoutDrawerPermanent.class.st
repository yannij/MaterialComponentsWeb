"
I am a layout for an medium sized screen (i.e. laptop). A persistent Drawer is used, and the Side Sheet appears beside the Body.
"
Class {
	#name : #MDSLayoutDrawerPermanent,
	#superclass : #MDSLayout,
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSLayoutDrawerPermanent >> cellSpan [

	^ 6
]

{ #category : #initialization }
MDSLayoutDrawerPermanent >> initializeComplete [

	self sideNav bePersistentDrawer; beDismissed
]

{ #category : #rendering }
MDSLayoutDrawerPermanent >> renderContentOn: html [

	self renderLayoutDrawerPermanentOn: html
]

{ #category : #rendering }
MDSLayoutDrawerPermanent >> renderLayoutDrawerPermanentOn: html [

	html div class: self cssClass if: (self cssClass notNil); style: 'height: 100vh'; with: self sideNav.
	html render: self topAppBar.

	html div
		"style: 'max-width: 1920px';"
		mdcDrawerAppContent;
		with: [
			| div |
			div := html div.
			self denseView
				ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
				ifFalse: [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
			div
				style: 'float: left';
				style: 'overflow-x: auto';
				"mdcStyle: self contentAreaWidthCalc if: self sideSheetVisible;"
				class: 'mcw-layout-desktop';
				with: [ self renderContentToShowOn: html ] ]
]
