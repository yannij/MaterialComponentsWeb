Class {
	#name : #MDSDrawerNavigationApp,
	#superclass : #MDSLayoutExampleApp,
	#instVars : [
		'drawer',
		'list'
	],
	#category : #'Material-Web-Demo'
}

{ #category : #initialization }
MDSDrawerNavigationApp class >> applicationPath [

	^ 'material/nav-drawer'
]

{ #category : #initialization }
MDSDrawerNavigationApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self mcwRegisterDeployment: self applicationPath
]

{ #category : #accessing }
MDSDrawerNavigationApp >> applicationTitle [

	^ 'Drawer Navigation'
]

{ #category : #initialization }
MDSDrawerNavigationApp >> buildDrawer [

	^ MDSDrawer content: self list title: self applicationTitle subtitle: 'Subtitle'
]

{ #category : #initialization }
MDSDrawerNavigationApp >> buildList: aNumber [
	| newObject icons iconCount |

	icons := self class iconNames.
	iconCount := icons size.

	newObject := MDSList new.
	1 to: aNumber do: [ :i | | theLabel iconName |
		theLabel := 'Page ', i printString.
		iconName := icons at: (i \\ iconCount) + 1.
		newObject itemsAdd: (MDSListItem label: theLabel icon: iconName callback: [ self currentPageSet: theLabel ]) ].
	
	^ newObject
]

{ #category : #accessing }
MDSDrawerNavigationApp >> currentPageSet: anObject [

	super currentPageSet: anObject.

	"self tabs do: [ :eachTab | eachTab active: (eachTab label = anObject) ]"
]

{ #category : #accessing }
MDSDrawerNavigationApp >> drawer [

	^ drawer
]

{ #category : #accessing }
MDSDrawerNavigationApp >> drawer: anObject [

	drawer := anObject
]

{ #category : #initialization }
MDSDrawerNavigationApp >> initialize [

	super initialize.

	self list: (self buildList: 12).
	self drawer: self buildDrawer
]

{ #category : #accessing }
MDSDrawerNavigationApp >> list [

	^ list
]

{ #category : #accessing }
MDSDrawerNavigationApp >> list: anObject [

	list := anObject
]

{ #category : #rendering }
MDSDrawerNavigationApp >> renderContentAreaOn: html [

	self renderCurrentDisplayOn: html
]

{ #category : #rendering }
MDSDrawerNavigationApp >> renderLayoutOn: html [

	"html div ""'style: ''height: 100vh'';'"" with: self drawer."
	html render: self drawer.
	"html render: (MDSTopAppBar title: self applicationTitle)."

	html div mdcDrawerAppContent; style: 'width: 800px'; with: [
		self renderContentAreaOn: html ]
]
