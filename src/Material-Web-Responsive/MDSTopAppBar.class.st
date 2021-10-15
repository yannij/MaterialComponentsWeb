Class {
	#name : #MDSTopAppBar,
	#superclass : #MDSComponent,
	#instVars : [
		'title',
		'collapsed',
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
MDSTopAppBar >> collapsed [

	^ collapsed
]

{ #category : #accessing }
MDSTopAppBar >> collapsed: anObject [

	collapsed := anObject
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

	self collapsed: false
]

{ #category : #accessing }
MDSTopAppBar >> middleSection [

	^ middleSection
]

{ #category : #accessing }
MDSTopAppBar >> middleSection: anObject [

	middleSection := anObject
]

{ #category : #rendering }
MDSTopAppBar >> renderContentOn: html [
	| tag |

	tag := html header mdcTopAppBar.

	"self isShort ifTrue: [ tag mdcTopAppBar_short ].
	self isShortCollapsed ifTrue: [ tag mdcTopAppBar_shortCollapsed ].
	self needsPaddingRight ifTrue: [ tag style: 'padding-right: 256px' ]."

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
MDSTopAppBar >> shortCollapsed [
	"TODO: added to be compatible with MCW layout class"

	^ false
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
