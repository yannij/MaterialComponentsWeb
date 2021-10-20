"
I am a demo application that uses the Material Design Seaside widgets to present a custom Tab-based navigation flow.
"
Class {
	#name : #MDSTabNavigationApp,
	#superclass : #MDSLayoutExampleApp,
	#instVars : [
		'tabs'
	],
	#category : #'Material-Demo-Web'
}

{ #category : #initialization }
MDSTabNavigationApp class >> applicationPath [

	^ 'material/nav-tabs'
]

{ #category : #initialization }
MDSTabNavigationApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath
]

{ #category : #accessing }
MDSTabNavigationApp >> applicationTitle [

	^ 'Tab Navigation'
]

{ #category : #initialization }
MDSTabNavigationApp >> buildTabs: aNumber [
	| newObject icons iconCount |

	icons := self class iconNames.
	iconCount := icons size.

	newObject := MDSTabs new.
	1 to: aNumber do: [ :i | | tabLabel iconName |
		tabLabel := 'Page ', i printString.
		iconName := icons at: (i \\ iconCount) + 1.
		newObject tabsAdd: (MDSTab label: tabLabel icon: iconName callback: [ self tabSet: tabLabel ]) ].
	
	^ newObject
]

{ #category : #initialization }
MDSTabNavigationApp >> buildTopAppBar [
	| widget |

	widget := MDSTopAppBar title: self applicationTitle.
	widget middleSection: self tabs.

	^ widget
]

{ #category : #initialization }
MDSTabNavigationApp >> initialize [

	super initialize.

	"self tabs: self buildTabs"
	self tabs: (self buildTabs: 6).
	self tabs showIconOn.
	"self tabs showIconOff."
	self tabs showLabelOn.
	"self tabs showLabelOff."
	self tabs showIconStacked
]

{ #category : #rendering }
MDSTabNavigationApp >> renderContentAreaOn: html [

	html div mdcTopAppBar_fixedAdjust.
	html div style: 'width: 600px; margin: 24px auto; overflow-x: auto'; with: [
		html render: self tabs ].
	self renderCurrentDisplayOn: html
]

{ #category : #rendering }
MDSTabNavigationApp >> renderLayoutOn: html [

	html div with: [
		self renderTopAppBarOn: html.
		self renderContentAreaOn: html ]
]

{ #category : #rendering }
MDSTabNavigationApp >> renderTopAppBarOn: html [

	html render: self buildTopAppBar
]

{ #category : #accessing }
MDSTabNavigationApp >> tabSet: anObject [

	self currentPageSet: anObject.

	self tabs do: [ :eachTab | eachTab active: (eachTab label = anObject) ]
]

{ #category : #accessing }
MDSTabNavigationApp >> tabs [

	^ tabs
]

{ #category : #accessing }
MDSTabNavigationApp >> tabs: anObject [

	tabs := anObject
]
