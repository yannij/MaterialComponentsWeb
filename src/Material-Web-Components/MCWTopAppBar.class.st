Class {
	#name : #MCWTopAppBar,
	#superclass : #MCWAppBar,
	#instVars : [
		'dense',
		'short',
		'shortCollapsed'
	],
	#category : 'Material-Web-Components'
}

{ #category : #accessing }
MCWTopAppBar >> dense [
	^ dense
]

{ #category : #accessing }
MCWTopAppBar >> dense: anObject [
	dense := anObject
]

{ #category : #accessing }
MCWTopAppBar >> height [

	^self isShort ifTrue: [56] ifFalse: [self isDense ifTrue: [48] ifFalse: [64]]
]

{ #category : #initialization }
MCWTopAppBar >> initialize [

	super initialize.

	self dense: false.
	self short: false.
	self shortCollapsed: false

]

{ #category : #testing }
MCWTopAppBar >> isDense [

	^self dense
]

{ #category : #testing }
MCWTopAppBar >> isShort [

	^self short
]

{ #category : #testing }
MCWTopAppBar >> isShortCollapsed [

	^self shortCollapsed
]

{ #category : #accessing }
MCWTopAppBar >> marginHeight [

	^self isShortCollapsed ifTrue: [0] ifFalse: [self height]
]

{ #category : #accessing }
MCWTopAppBar >> paddingHeight [

	^self isShortCollapsed ifTrue: [self height] ifFalse: [0]
]

{ #category : #rendering }
MCWTopAppBar >> renderContentOn: html [
	| tag |

	self isHidden ifTrue: [^self].

	tag := html header mdcTopAppBar.

	self isDense ifTrue: [tag mdcTopAppBar_dense].
	self isShort ifTrue: [tag mdcTopAppBar_short].
	self isShortCollapsed ifTrue: [tag mdcTopAppBar_shortCollapsed].

	tag
		mdcAutoInit: 'MDCTopAppBar';
		style: self mcwStyle;
		style: 'z-index: 7';
		with: [
			html div mdcTopAppBar__row; with: [
				html section
					mdcTopAppBar__section; mdcTopAppBar__section_alignStart;
					with: [
						self startSection do: [:each | html render: each].
						html span mdcTopAppBar__title; with: self toolbarTitle].
				html section
					mdcTopAppBar__section; mdcTopAppBar__section_alignEnd;
					with: [
						self endSection do: [:eachItem | html render: eachItem]]]].

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

{ #category : #actions }
MCWTopAppBar >> topAppBarSpacersHide [
	"Workaround to handle problem with dismissable drawer that obscures right side of appBar"

	self endSection do: [:each |
		each iconName = 'bookmark' ifTrue: [each beHidden]]
]

{ #category : #actions }
MCWTopAppBar >> topAppBarSpacersShow [
	"Workaround to handle problem with dismissable drawer that obscures right side of appBar"

	self endSection do: [:each |
		each iconName = 'bookmark' ifTrue: [each beUnHidden]]
]
