Class {
	#name : #MCWFloatingActionButton,
	#superclass : #MCWButton,
	#instVars : [
		'rippledFab',
		'miniFab'
	],
	#category : #'Material-Web-Components'
}

{ #category : #accessing }
MCWFloatingActionButton >> beMiniFab [

	self miniFab: true
]

{ #category : #accessing }
MCWFloatingActionButton >> beNonMiniFab [

	self miniFab: false
]

{ #category : #accessing }
MCWFloatingActionButton >> beNonRippledFab [

	self rippledFab: false
]

{ #category : #accessing }
MCWFloatingActionButton >> beRippledFab [

	self rippledFab: true
]

{ #category : #rendering }
MCWFloatingActionButton >> bottomStyle [

	^ 'bottom: {1}rem' format: (Array with: (self isMiniFab ifTrue: [ '2.5' ] ifFalse: [ '2' ]))
]

{ #category : #testing }
MCWFloatingActionButton >> hasRipple [

	^ self rippledFab
]

{ #category : #initialization }
MCWFloatingActionButton >> initialize [

	super initialize.

	self rippledFab: false.
	self miniFab: false.

]

{ #category : #testing }
MCWFloatingActionButton >> isMiniFab [

	^ self miniFab
]

{ #category : #accessing }
MCWFloatingActionButton >> miniFab [
	^ miniFab
]

{ #category : #accessing }
MCWFloatingActionButton >> miniFab: anObject [
	miniFab := anObject
]

{ #category : #rendering }
MCWFloatingActionButton >> renderContentOn: html [

	self hasRipple
		ifTrue: [ self renderWithRippleOn: html ]
		ifFalse: [ self renderCssOnlyOn: html ]
]

{ #category : #rendering }
MCWFloatingActionButton >> renderCssOnlyOn: html [

	html button
		id: self id;
		mdcMaterialIcons;
		mdcFab;
		mdcFab_mini_if: self isMiniFab;
		style: 'position: absolute; right: 1rem; z-index: 1';
		style: self bottomStyle;
		with: [
			html span mdcFab__icon: 'add' ]
]

{ #category : #rendering }
MCWFloatingActionButton >> renderWithRippleOn: html [
	| htmlId |

	htmlId := self id ifNil: [ html nextId ].
	html button
		id: htmlId;
		mdcMaterialIcons;
		mdcFab;
		mdcFab_mini_if: self isMiniFab;
		mdcAutoInit: 'MDCRipple';
		"script: (JSScript new add: (JSStream new
				nextPutAll: 'mdc.ripple.MDCRipple.attachTo(document.getElementById(''';
				nextPutAll: htmlId;
				nextPutAll: '''))'));"
		mdcRippleUpgraded;
		mdcRippleUpgraded_foregroundActivation;
		style: '--mdc-ripple-fg-size:33.6px; --mdc-ripple-fg-scale:2.65464; --mdc-ripple-fg-translate-start:19.606px, 0.938037px; --mdc-ripple-fg-translate-end:11.2px, 11.2px;';
		style: 'position: absolute; right: 1rem; z-index: 1';
		style: self bottomStyle;
		with: [
			html span mdcFab__icon: 'add' ].

]

{ #category : #accessing }
MCWFloatingActionButton >> rippledFab [
	^ rippledFab
]

{ #category : #accessing }
MCWFloatingActionButton >> rippledFab: anObject [
	rippledFab := anObject
]
