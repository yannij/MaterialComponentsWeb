Class {
	#name : #MCWTopAppBar,
	#superclass : #MCWLayoutComponent,
	#instVars : [
		'dense',
		'short',
		'shortCollapsed',
		'startSection',
		'endSection',
		'appBarTitle'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MCWTopAppBar >> appBarTitle [
	^ appBarTitle
]

{ #category : #accessing }
MCWTopAppBar >> appBarTitle: anObject [
	appBarTitle := anObject
]

{ #category : #accessing }
MCWTopAppBar >> endSection [
	^ endSection
]

{ #category : #accessing }
MCWTopAppBar >> endSection: anObject [
	endSection := anObject
]

{ #category : #accessing }
MCWTopAppBar >> height [

	^ self isShort ifTrue: [ 56 ] ifFalse: [ self isDense ifTrue: [ 48 ] ifFalse: [ 64 ] ]
]

{ #category : #initialization }
MCWTopAppBar >> initialize [

	super initialize.

	self appBarTitle: ''.
	self startSection: OrderedCollection new.
	self endSection: OrderedCollection new.

	self short: false.
	self shortCollapsed: false
]

{ #category : #testing }
MCWTopAppBar >> isShort [

	^ self short
]

{ #category : #testing }
MCWTopAppBar >> isShortCollapsed [

	^ self shortCollapsed
]

{ #category : #accessing }
MCWTopAppBar >> marginHeight [

	^ self isShortCollapsed ifTrue: [ 0 ] ifFalse: [ self height ]
]

{ #category : #testing }
MCWTopAppBar >> needsPaddingRight [

	^ self layout sideNav isDrawerOpen and: [ self isShortCollapsed not ]
]

{ #category : #accessing }
MCWTopAppBar >> paddingHeight [

	^ self isShortCollapsed ifTrue: [ self height ] ifFalse: [ 0 ]
]

{ #category : #rendering }
MCWTopAppBar >> renderContentOn: html [
	| tag |

	self isHidden ifTrue: [ ^ self ].

	tag := html header mdcTopAppBar.

	tag mdcTopAppBar_dense_if: self mcwDenseView.
	self isShort ifTrue: [ tag mdcTopAppBar_short ].
	self isShortCollapsed ifTrue: [ tag mdcTopAppBar_shortCollapsed ].

	self needsPaddingRight ifTrue: [ tag style: 'padding-right: 256px' ].

	tag
		mdcAutoInit: 'MDCTopAppBar';
		"style: 'position: absolute';"
		style: 'z-index: 7';
		with: [
			html div mdcTopAppBar__row; with: [
				html section
					mdcTopAppBar__section; mdcTopAppBar__section_alignStart;
					with: [
						self startSectionFiltered do: [ :each | html render: each ].
						html span mdcTopAppBar__title; with: self appBarTitle ].
				html section
					mdcTopAppBar__section; mdcTopAppBar__section_alignEnd;
					with: [
						self endSection do: [ :eachItem | html render: eachItem ] ] ] ]
]

{ #category : #accessing }
MCWTopAppBar >> short [
	^ short
]

{ #category : #accessing }
MCWTopAppBar >> short: anObject [
	short := anObject
]

{ #category : #accessing }
MCWTopAppBar >> shortCollapsed [
	^ shortCollapsed
]

{ #category : #accessing }
MCWTopAppBar >> shortCollapsed: anObject [
	shortCollapsed := anObject
]

{ #category : #accessing }
MCWTopAppBar >> startSection [
	^ startSection
]

{ #category : #accessing }
MCWTopAppBar >> startSection: anObject [
	startSection := anObject
]

{ #category : #accessing }
MCWTopAppBar >> startSectionFiltered [

	self layout isDesktopStyle ifTrue: [
		"TODO: make the drawer dismiss menu icon findable, and leave it off the answer"
		^ #() ].
	
	^ self startSection
]
