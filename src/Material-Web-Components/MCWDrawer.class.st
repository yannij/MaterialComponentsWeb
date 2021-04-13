Class {
	#name : #MCWDrawer,
	#superclass : #MCWWebComponent,
	#instVars : [
		'drawerType',
		'drawerTitle',
		'drawerSubtitle',
		'list',
		'dir',
		'menuIconPersistent',
		'menuIconTemporary',
		'isDismissed'
	],
	#category : #'Material-Web-Components'
}

{ #category : #actions }
MCWDrawer >> beDirectionLeftToRight [

	self dir: 'ltr'
]

{ #category : #actions }
MCWDrawer >> beDirectionToRightToLeft [

	self dir: 'rtl'
]

{ #category : #actions }
MCWDrawer >> beDismissed [

	self isDismissed: true.
	self session presenter ifNotNil: [:value | value layout topAppBar topAppBarSpacersHide]
]

{ #category : #actions }
MCWDrawer >> beDismissibleDrawer [

	self drawerType: #dismissible
]

{ #category : #actions }
MCWDrawer >> beModalDrawer [

	self drawerType: #modal
]

{ #category : #actions }
MCWDrawer >> bePersistentDrawer [

	self drawerType: #persistent
]

{ #category : #accessing }
MCWDrawer >> dir [
	^ dir
]

{ #category : #accessing }
MCWDrawer >> dir: anObject [
	dir := anObject
]

{ #category : #actions }
MCWDrawer >> dismissedToggle [

	self isDismissedToggle
]

{ #category : #accessing }
MCWDrawer >> drawerSubtitle [
	^ drawerSubtitle
]

{ #category : #accessing }
MCWDrawer >> drawerSubtitle: anObject [
	drawerSubtitle := anObject
]

{ #category : #accessing }
MCWDrawer >> drawerTitle [
	^ drawerTitle
]

{ #category : #accessing }
MCWDrawer >> drawerTitle: anObject [
	drawerTitle := anObject
]

{ #category : #accessing }
MCWDrawer >> drawerType [
	^ drawerType
]

{ #category : #accessing }
MCWDrawer >> drawerType: anObject [
	drawerType := anObject
]

{ #category : #actions }
MCWDrawer >> getMenuIcon [

	self isPersistentDrawer
		ifTrue: [^self menuIconPersistent].

	self isModalDrawer
		ifTrue: [^self menuIconTemporary].

	^self menuIconPersistent

]

{ #category : #initialization }
MCWDrawer >> initialize [

	super initialize.

	self beDismissibleDrawer.
	self isDismissed: true.
	self drawerTitle: ''.
	self drawerSubtitle: ''.
	self list: OrderedCollection new.


]

{ #category : #accessing }
MCWDrawer >> isDismissed [
	^ isDismissed
]

{ #category : #accessing }
MCWDrawer >> isDismissed: anObject [
	isDismissed := anObject
]

{ #category : #actions }
MCWDrawer >> isDismissedToggle [

	self isDismissed: self isDismissed not.
	(self isDismissed and: [self isDismissibleDrawer])
		ifTrue: [self session presenter layout topAppBar topAppBarSpacersHide]
		ifFalse: [self session presenter layout topAppBar topAppBarSpacersShow].
	(self isModalDrawer or: self isPersistentDrawer)
		ifTrue: [self session presenter layout topAppBar topAppBarSpacersHide]
]

{ #category : #testing }
MCWDrawer >> isDismissibleDrawer [

	^self drawerType = #dismissible
]

{ #category : #testing }
MCWDrawer >> isDrawerOpen [

	^(self isDismissibleDrawer or: [self isModalDrawer]) and: [ self isDismissed not ]
]

{ #category : #testing }
MCWDrawer >> isModalDrawer [

	^self drawerType = #modal
]

{ #category : #testing }
MCWDrawer >> isPersistentDrawer [

	^self drawerType = #persistent
]

{ #category : #accessing }
MCWDrawer >> jsDrawerType [

	self isModalDrawer ifTrue: [^'mdc.drawer.MDCTemporaryDrawer'].
	self isPersistentDrawer ifTrue: [^'mdc.drawer.MDCPersistentDrawer'].
	"self isPermanentAboveToolbarDrawer ifTrue: [^'mdc.drawer.MDCPermanentDrawer'].
	self isPermanentBelowToolbarDrawer ifTrue: [^'mdc.drawer.MDCPermanentDrawer']."
	^''

]

{ #category : #accessing }
MCWDrawer >> list [
	^ list
]

{ #category : #accessing }
MCWDrawer >> list: anObject [
	list := anObject
]

{ #category : #accessing }
MCWDrawer >> menuIconPersistent [
	^ menuIconPersistent
]

{ #category : #accessing }
MCWDrawer >> menuIconPersistent: anObject [
	menuIconPersistent := anObject
]

{ #category : #accessing }
MCWDrawer >> menuIconTemporary [
	^ menuIconTemporary
]

{ #category : #accessing }
MCWDrawer >> menuIconTemporary: anObject [
	menuIconTemporary := anObject
]

{ #category : #actions }
MCWDrawer >> menuItemCallback [

	self isModalDrawer ifTrue: [self isDismissed: true]
]

{ #category : #rendering }
MCWDrawer >> renderContentOn: html [
	| drawerTag |

	drawerTag := html aside mdcDrawer.
	self isModalDrawer ifTrue: [drawerTag mdcDrawer_modal].
	self isDismissibleDrawer ifTrue: [drawerTag mdcDrawer_dismissible].

	drawerTag
		id: self id;
		mdcTopAppBar_fixedAdjust;
		class: (self isDrawerOpen ifTrue: ['mdc-drawer--open'] ifFalse: ['']);
		with: [
			self renderDrawerHeaderOn: html.
			self renderDrawerContentOn: html].

	self isModalDrawer ifTrue: [html div class: 'mdc-drawer-scrim'].

]

{ #category : #rendering }
MCWDrawer >> renderDrawerContentOn: html [

	html div
		mdcDrawer__content
		with: [
		html navigation
			class: self cssClass;
			attributeAt: 'dir' put: self dir;
			"style: 'background-color: #EC4E8C';"
			onClick: (JSScript new add: (JSStream new
				nextPutAll: '
var activatedClass = ''mdc-list-item--selected'';
var el = event.target;
while (el && !el.classList.contains(''mdc-list-item'')) {
	el = el.parentElement;
}
if (el) {
	var activatedItem = document.querySelector(''.'' + activatedClass);
	if (activatedItem) {
		activatedItem.classList.remove(activatedClass);
	}
	event.target.classList.add(activatedClass);
}'); yourself);
			with: [
			"html div mdcDrawer__toolbarSpacer."
			html div mdcListGroup; with: [
				html render: self list ] ] ].

]

{ #category : #rendering }
MCWDrawer >> renderDrawerHeaderOn: html [

	(self drawerTitle notEmpty or: [self drawerSubtitle notEmpty]) ifTrue: [
		html div mdcDrawer__header; with: [
			self drawerTitle notEmpty ifTrue: [
				html div mdcDrawer__title; with: self drawerTitle].
			self drawerSubtitle notEmpty ifTrue: [
				html div mdcDrawer__subtitle; with: self drawerSubtitle]]
		]

]
