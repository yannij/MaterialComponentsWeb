Class {
	#name : #MDSLayoutTopAppBarTabs,
	#superclass : #MDSLayout,
	#category : #'Material-Web-Responsive'
}

{ #category : #actions }
MDSLayoutTopAppBarTabs >> adjustTopAppBar [

	self topAppBar startSection ifNotNil: [ :value | value do: [ :each | each beUnHidden ] ]
]

{ #category : #accessing }
MDSLayoutTopAppBarTabs >> cellSpan [

	^ 6
]

{ #category : #initialization }
MDSLayoutTopAppBarTabs >> initializeComplete [

	self sideNav beDismissibleDrawer; beDismissed.
	self adjustTopAppBar
]

{ #category : #rendering }
MDSLayoutTopAppBarTabs >> renderContentOn: html [

	self renderLayoutTopAppBarTabsOn: html
]

{ #category : #rendering }
MDSLayoutTopAppBarTabs >> renderLayoutTopAppBarTabsOn: html [
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
		class: 'mcw-layout-tablet';
		with: [
			self renderContentToShowOn: html ]
]

{ #category : #actions }
MDSLayoutTopAppBarTabs >> topAppBarCollapsedToggle [
	"Do nothing. Ignore the collapse request, in the the layout"
]
