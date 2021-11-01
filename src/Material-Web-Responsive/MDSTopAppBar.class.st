Class {
	#name : #MDSTopAppBar,
	#superclass : #MDSComponent,
	#instVars : [
		'title',
		'dense',
		'short',
		'shortCollapsed',
		'prominent',
		'allotDrawerWidth',
		'startSection',
		'middleSection',
		'endSection'
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

{ #category : #initialization }
MDSTopAppBar >> initialize [

	super initialize.

	self allotDrawerWidth: false.
	self dense: false.
	self short: false.
	self prominent: false.
	self shortCollapsed: false
]

{ #category : #testing }
MDSTopAppBar >> isDense [

	^ self dense
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
MDSTopAppBar >> prominentOff [

	self prominent: false
]

{ #category : #accessing }
MDSTopAppBar >> prominentOn [

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
	self needsPaddingRight ifTrue: [ tag style: 'padding-right: 256px' ].

	"For multiple rows or sections in the top appbar, use custom subclass"
	tag mdcAutoInit: 'MDCTopAppBar'; with: [
		html div mdcTopAppBar__row; with: [
			html section mdcTopAppBar__section; mdcTopAppBar__section_alignStart; with: [
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
						html render: value ] ] ] ]
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

	self shortCollapsed: false
]

{ #category : #accessing }
MDSTopAppBar >> shortCollapsedOn [

	self shortCollapsed: true
]

{ #category : #accessing }
MDSTopAppBar >> shortCollapsedToggle [

	self shortCollapsed: self shortCollapsed not
]

{ #category : #accessing }
MDSTopAppBar >> shortOff [

	self short: false
]

{ #category : #accessing }
MDSTopAppBar >> shortOn [

	self short: true
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
