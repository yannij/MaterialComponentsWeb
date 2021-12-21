Class {
	#name : #MDSTopAppBar,
	#superclass : #MDSComponent,
	#instVars : [
		'title',
		'dense',
		'fixed',
		'short',
		'shortCollapsed',
		'prominent',
		'allotDrawerWidth',
		'startSection',
		'middleSection',
		'endSection',
		'navigationIcon',
		'navigationIconVisible',
		'zIndex'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSTopAppBar class >> title: aString [

	^ self new
		title: aString;
		yourself
]

{ #category : #accessing }
MDSTopAppBar >> allotDrawerWidth [

	^ allotDrawerWidth
]

{ #category : #accessing }
MDSTopAppBar >> allotDrawerWidth: anObject [

	allotDrawerWidth := anObject
]

{ #category : #accessing }
MDSTopAppBar >> dense [

	^ dense
]

{ #category : #accessing }
MDSTopAppBar >> dense: anObject [

	dense := anObject
]

{ #category : #accessing }
MDSTopAppBar >> denseOff [

	self dense: false
]

{ #category : #accessing }
MDSTopAppBar >> denseOn [

	self dense: true
]

{ #category : #accessing }
MDSTopAppBar >> endSection [

	^ endSection
]

{ #category : #accessing }
MDSTopAppBar >> endSection: anObject [

	endSection := anObject
]

{ #category : #accessing }
MDSTopAppBar >> endSectionAdd: anItem [

	self endSection
		ifNil: [ self endSection: (OrderedCollection with: anItem) ]
		ifNotNil: [ :value | value add: anItem ]
]

{ #category : #accessing }
MDSTopAppBar >> fixed [

	^ fixed
]

{ #category : #accessing }
MDSTopAppBar >> fixed: anObject [

	fixed := anObject
]

{ #category : #accessing }
MDSTopAppBar >> fixedOn [

	self fixed: true.
	self short: false.
	self prominent: false
]

{ #category : #initialization }
MDSTopAppBar >> initialize [

	super initialize.

	self navigationIconVisible: true.
	self allotDrawerWidth: false.
	self dense: false.
	self fixed: true.
	self short: false.
	self prominent: false.
	self shortCollapsed: false
]

{ #category : #testing }
MDSTopAppBar >> isDense [

	^ self dense
]

{ #category : #testing }
MDSTopAppBar >> isFixed [

	^ self fixed
]

{ #category : #testing }
MDSTopAppBar >> isProminent [

	^ self prominent
]

{ #category : #testing }
MDSTopAppBar >> isShort [

	^ self short
]

{ #category : #testing }
MDSTopAppBar >> isShortCollapsed [

	^ self shortCollapsed
]

{ #category : #accessing }
MDSTopAppBar >> middleSection [

	^ middleSection
]

{ #category : #accessing }
MDSTopAppBar >> middleSection: anObject [

	middleSection := anObject
]

{ #category : #accessing }
MDSTopAppBar >> navigationIcon [

	^ navigationIcon
]

{ #category : #accessing }
MDSTopAppBar >> navigationIcon: anObject [

	navigationIcon := anObject
]

{ #category : #accessing }
MDSTopAppBar >> navigationIconVisible [

	^ navigationIconVisible
]

{ #category : #accessing }
MDSTopAppBar >> navigationIconVisible: anObject [

	navigationIconVisible := anObject
]

{ #category : #testing }
MDSTopAppBar >> needsPaddingRight [

	self shortCollapsed ifTrue: [ ^ false ].

	"layoutDrawer := self mcwApplicationGet layout sideNav.
	^ layoutDrawer isDismissibleDrawer and: [ layoutDrawer isDrawerOpen ]"
	^ allotDrawerWidth
]

{ #category : #accessing }
MDSTopAppBar >> prominent [

	^ prominent
]

{ #category : #accessing }
MDSTopAppBar >> prominent: anObject [

	prominent := anObject
]

{ #category : #accessing }
MDSTopAppBar >> prominentOn [

	self fixed: false.
	self short: false.
	self prominent: true
]

{ #category : #rendering }
MDSTopAppBar >> renderContentOn: html [
	| tag |

	tag := html header mdcTopAppBar.
	self cssClass ifNotNil: [ :value | tag class: value ].

	tag mdcTopAppBar_dense_if: self isDense.
	self isShort ifTrue: [ tag mdcTopAppBar_short ].
	self isShortCollapsed ifTrue: [ tag mdcTopAppBar_shortCollapsed ].
	self isProminent ifTrue: [ tag mdcTopAppBar_prominent ].
	self zIndex ifNotNil: [ :value | tag style: 'z-index: ', value printString ].
	self needsPaddingRight ifTrue: [ tag style: 'padding-right: 256px' ].

	"For multiple rows or sections in the top appbar, use custom subclass"
	tag mdcAutoInit: 'MDCTopAppBar'; with: [
		self isShortCollapsed
			ifTrue: [ self renderTopAppBarRowCollapsedOn: html ]
			ifFalse: [ self renderTopAppBarRowOn: html ] ]
]

{ #category : #rendering }
MDSTopAppBar >> renderTopAppBarRowCollapsedOn: html [

	html div mdcTopAppBar__row; with: [
		html section mdcTopAppBar__section; mdcTopAppBar__section_alignStart; with: [
			self navigationIcon ifNotNil: [ :value |
				self navigationIconVisible ifTrue: [html render: value ] ].
			html render: (MDSTopAppBarActionItem materialIcon: 'arrow_circle_right' callback: [ self shortCollapsedOff ]) ] ]
]

{ #category : #rendering }
MDSTopAppBar >> renderTopAppBarRowOn: html [

	html div mdcTopAppBar__row; with: [
		html section mdcTopAppBar__section; mdcTopAppBar__section_alignStart; with: [
			self navigationIcon ifNotNil: [ :value |
				self navigationIconVisible ifTrue: [html render: value ] ].
			self startSection ifNotNil: [ :value | html render: value ].
			html span mdcTopAppBar__title; with: self title ].
		self middleSection ifNotNil: [ :value |
			html section mdcTopAppBar__section; with: [ html render: value ] ].
		self endSection
			ifNil: [
				(self startSection notNil or: [ self title notNil ]) ifTrue: [
					html section mdcTopAppBar__section; mdcTopAppBar__section_alignEnd; with: [ html div ] ] ]
			ifNotNil: [ :value |
				html section mdcTopAppBar__section; mdcTopAppBar__section_alignEnd; with: [
					html render: value ] ] ]
]

{ #category : #accessing }
MDSTopAppBar >> short [

	^ short
]

{ #category : #accessing }
MDSTopAppBar >> short: anObject [

	short := anObject
]

{ #category : #accessing }
MDSTopAppBar >> shortCollapsed [

	^ shortCollapsed
]

{ #category : #accessing }
MDSTopAppBar >> shortCollapsed: anObject [

	shortCollapsed := anObject
]

{ #category : #accessing }
MDSTopAppBar >> shortCollapsedOff [

	self fixedOn.
	self shortCollapsed: false
]

{ #category : #accessing }
MDSTopAppBar >> shortCollapsedOn [

	self shortOn.
	self shortCollapsed: true
]

{ #category : #accessing }
MDSTopAppBar >> shortCollapsedToggle [

	self isShortCollapsed
		ifTrue: [ self shortCollapsedOff ]
		ifFalse: [ self shortCollapsedOn ]
]

{ #category : #accessing }
MDSTopAppBar >> shortOn [

	self fixed: false.
	self short: true.
	self prominent: false.
]

{ #category : #accessing }
MDSTopAppBar >> startSection [

	^ startSection
]

{ #category : #accessing }
MDSTopAppBar >> startSection: anObject [

	startSection := anObject
]

{ #category : #accessing }
MDSTopAppBar >> startSectionAdd: anItem [

	self startSection
		ifNil: [ self startSection: (OrderedCollection with: anItem) ]
		ifNotNil: [ :value | value add: anItem ]
]

{ #category : #accessing }
MDSTopAppBar >> title [

	^ title
]

{ #category : #accessing }
MDSTopAppBar >> title: anObject [

	title := anObject
]

{ #category : #accessing }
MDSTopAppBar >> zIndex [

	^ zIndex
]

{ #category : #accessing }
MDSTopAppBar >> zIndex: anObject [

	zIndex := anObject
]
