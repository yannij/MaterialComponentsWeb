Class {
	#name : #MDSLayoutExtraSmall,
	#superclass : #MDSLayout,
	#category : #'Material-Web-Responsive'
}

{ #category : #actions }
MDSLayoutExtraSmall >> adjustTopAppBar [

	self topAppBar startSection do: [ :each | each beUnHidden ]
]

{ #category : #accessing }
MDSLayoutExtraSmall >> cellSpan [

	^ 6
]

{ #category : #initialization }
MDSLayoutExtraSmall >> initializeComplete [

	self sideNav beModalDrawer; beDismissed.
	self adjustTopAppBar
]

{ #category : #rendering }
MDSLayoutExtraSmall >> renderContentOn: html [

	self renderLayoutPhoneOn: html
]

{ #category : #rendering }
MDSLayoutExtraSmall >> renderLayoutPhoneOn: html [
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
