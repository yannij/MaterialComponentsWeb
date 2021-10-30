Class {
	#name : #MDSDrawer,
	#superclass : #MDSComponent,
	#instVars : [
		'title',
		'subtitle',
		'header',
		'content',
		'drawerType',
		'drawerOpen',
		'fixedAdjust'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #'instance creation' }
MDSDrawer class >> content: aComponent [

	^ self new
		content: aComponent;
		yourself
]

{ #category : #'instance creation' }
MDSDrawer class >> content: aComponent title: aTitleString [

	^ self content: aComponent title: aTitleString subtitle: nil
]

{ #category : #'instance creation' }
MDSDrawer class >> content: aComponent title: aTitleString subtitle: aSubtitleString [

	^ self new
		content: aComponent;
		title: aTitleString;
		subtitle: aSubtitleString
		yourself
]

{ #category : #accessing }
MDSDrawer >> beDismissed [

	self drawerOpen: false
]

{ #category : #'drawer type' }
MDSDrawer >> beDismissibleDrawer [

	self drawerType: #dismissible
]

{ #category : #accessing }
MDSDrawer >> beDrawerOpen [

	self drawerOpen: true
]

{ #category : #'drawer type' }
MDSDrawer >> beModalDrawer [

	self drawerType: #modal
]

{ #category : #'drawer type' }
MDSDrawer >> bePersistentDrawer [

	self drawerType: #persistent
]

{ #category : #accessing }
MDSDrawer >> content [

	^ content
]

{ #category : #accessing }
MDSDrawer >> content: anObject [

	content := anObject
]

{ #category : #'drawer type' }
MDSDrawer >> dismissIfModel [

	self isModalDrawer ifTrue: [ self beDismissed ]
]

{ #category : #accessing }
MDSDrawer >> dismissedToggle [

	self drawerOpenToggle
]

{ #category : #accessing }
MDSDrawer >> drawerOpen [

	^ drawerOpen
]

{ #category : #accessing }
MDSDrawer >> drawerOpen: anObject [

	drawerOpen := anObject
]

{ #category : #accessing }
MDSDrawer >> drawerOpenToggle [

	self drawerOpen: self drawerOpen not
]

{ #category : #accessing }
MDSDrawer >> drawerType [

	^ drawerType
]

{ #category : #accessing }
MDSDrawer >> drawerType: anObject [

	drawerType := anObject
]

{ #category : #accessing }
MDSDrawer >> fixedAdjust [

	^ fixedAdjust
]

{ #category : #accessing }
MDSDrawer >> fixedAdjust: anObject [

	fixedAdjust := anObject
]

{ #category : #accessing }
MDSDrawer >> fixedAdjustDense [

	self fixedAdjust: #dense
]

{ #category : #accessing }
MDSDrawer >> fixedAdjustNone [

	self fixedAdjust: nil
]

{ #category : #accessing }
MDSDrawer >> fixedAdjustRegular [

	self fixedAdjust: #regular
]

{ #category : #accessing }
MDSDrawer >> header [

	^ header
]

{ #category : #accessing }
MDSDrawer >> header: anObject [

	header := anObject
]

{ #category : #initialization }
MDSDrawer >> initialize [

	super initialize.

	self fixedAdjustRegular.
	self beDismissibleDrawer.
	self drawerOpen: false
]

{ #category : #'drawer type' }
MDSDrawer >> isDismissibleDrawer [

	^ self drawerType = #dismissible
]

{ #category : #'drawer type' }
MDSDrawer >> isDrawerOpen [

	^ (self isDismissibleDrawer or: [ self isModalDrawer ]) and: [ self drawerOpen ]
]

{ #category : #'drawer type' }
MDSDrawer >> isModalDrawer [

	^ self drawerType = #modal
]

{ #category : #'drawer type' }
MDSDrawer >> isPersistentDrawer [

	^ self drawerType = #persistent
]

{ #category : #initialization }
MDSDrawer >> layout: ignore [
]

{ #category : #rendering }
MDSDrawer >> renderContentOn: html [

	self renderDrawerOn: html
]

{ #category : #rendering }
MDSDrawer >> renderDrawerContentOn: html [

	html div mdcDrawer__content with: [
		html navigation
			"class: self cssClass;"
			"attributeAt: 'dir' put: self dir;"
			"style: 'background-color: #EC4E8C';"
			with: [
				html div mdcListGroup; with: [
					html render: self content ] ] ]
]

{ #category : #rendering }
MDSDrawer >> renderDrawerHeaderOn: html [

	(self title notNil or: [ self subtitle notNil ]) ifTrue: [
		html div mdcDrawer__header; with: [
			self title notNil ifTrue: [
				html div mdcDrawer__title; with: self title ].
			self subtitle notNil ifTrue: [
				html div mdcDrawer__subtitle; with: self subtitle ] ] ]

]

{ #category : #rendering }
MDSDrawer >> renderDrawerOn: html [
	| tag |

	tag := html aside mdcDrawer.
	self fixedAdjust = #regular ifTrue: [ tag mdcTopAppBar_fixedAdjust ].
	self fixedAdjust = #dense ifTrue: [ tag mdcTopAppBar_denseFixedAdjust ].
	self isModalDrawer ifTrue: [ tag mdcDrawer_modal ].
	self isDismissibleDrawer ifTrue: [ tag mdcDrawer_dismissible ].
	self isDrawerOpen ifTrue: [ tag mdcDrawer_open ].
	tag with: [
		self renderDrawerHeaderOn: html.
		self renderDrawerContentOn: html ].

	self isModalDrawer ifTrue: [ html div class: 'mdc-drawer-scrim' ]
]

{ #category : #accessing }
MDSDrawer >> subtitle [

	^ subtitle
]

{ #category : #accessing }
MDSDrawer >> subtitle: anObject [

	subtitle := anObject
]

{ #category : #accessing }
MDSDrawer >> title [

	^ title
]

{ #category : #accessing }
MDSDrawer >> title: anObject [

	title := anObject
]
