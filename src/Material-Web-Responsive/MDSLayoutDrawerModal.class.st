"
I am a layout for an extra-small sized screen (i.e. phone). A modal Drawer is used, and the Side Sheet appears below the Body.
"
Class {
	#name : #MDSLayoutDrawerModal,
	#superclass : #MDSLayout,
	#category : #'Material-Web-Responsive'
}

{ #category : #actions }
MDSLayoutDrawerModal >> adjustTopAppBar [

	self topAppBar startSection do: [ :each | each beUnHidden ]
]

{ #category : #accessing }
MDSLayoutDrawerModal >> cellSpan [

	^ 6
]

{ #category : #initialization }
MDSLayoutDrawerModal >> initializeComplete [

	self sideNav beModalDrawer; beDismissed.
	self adjustTopAppBar
]

{ #category : #rendering }
MDSLayoutDrawerModal >> renderContentOn: html [

	self renderLayoutDrawerModalOn: html
]

{ #category : #rendering }
MDSLayoutDrawerModal >> renderLayoutDrawerModalOn: html [
	| div |

	html render: self sideNav.
	html render: self topAppBar.

	div := html div.
	self mcwDenseView
		ifTrue: [ div mdcTopAppBar_denseFixedAdjust_if: self topAppBar shortCollapsed not ]
		ifFalse:  [ div mdcTopAppBar_fixedAdjust_if: self topAppBar shortCollapsed not ].
	div with: [
		html div
			class: 'mcw-layout-mobile';
			style: 'overflow-x: auto';
			style: 'padding-bottom: 40px';
			"style: 'min-width: 359px';
			style: 'max-width: 359px';"
			with: [ self renderContentToShowOn: html ] ]
]
