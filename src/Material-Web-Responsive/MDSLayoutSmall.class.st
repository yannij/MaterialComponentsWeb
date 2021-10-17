"
I am a layout for an small sized screen (i.e. tablet). A dismissible Drawer is used, and the Side Sheet appears beside the Body.
"
Class {
	#name : #MDSLayoutSmall,
	#superclass : #MDSLayout,
	#category : #'Material-Web-Responsive'
}

{ #category : #actions }
MDSLayoutSmall >> adjustTopAppBar [

	self topAppBar startSection do: [ :each | each beUnHidden ]
]

{ #category : #accessing }
MDSLayoutSmall >> cellSpan [

	^ 6
]

{ #category : #initialization }
MDSLayoutSmall >> initializeComplete [

	self sideNav beDismissibleDrawer; beDismissed.
	self adjustTopAppBar
]

{ #category : #rendering }
MDSLayoutSmall >> renderContentOn: html [

	self renderLayoutTabletOn: html
]

{ #category : #rendering }
MDSLayoutSmall >> renderLayoutTabletOn: html [

	html render: self sideNav.

	html div mdcDrawerAppContent;
		with: [
			| div |
			html render: self topAppBar.
			div := html div.
			self mcwDenseView
				ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
				ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
			div
				"style: 'border: 2px solid red';"
				style: 'float: left';
				style: 'overflow-x: auto';
				"mdcStyle: self contentAreaWidthCalc if: self sideSheetVisible;"
				class: 'mcw-layout-tablet';
				with: [ self renderContentToShowOn: html ] ]
]
