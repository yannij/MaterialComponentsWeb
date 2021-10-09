Class {
	#name : #MDSTopAppBar,
	#superclass : #MCWComponent,
	#instVars : [
		'title',
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
MDSTopAppBar >> endSection [

	^ endSection
]

{ #category : #accessing }
MDSTopAppBar >> endSection: anObject [

	endSection := anObject
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

	tag mdcTopAppBar_dense_if: self mcwDenseView.
	"self isShort ifTrue: [ tag mdcTopAppBar_short ].
	self isShortCollapsed ifTrue: [ tag mdcTopAppBar_shortCollapsed ].
	self needsPaddingRight ifTrue: [ tag style: 'padding-right: 256px' ]."

	"For multiple rows or sections in the top appbar, use custom code"
	tag mdcAutoInit: 'MDCTopAppBar'; with: [
		html div mdcTopAppBar__row; with: [
			html section mdcTopAppBar__section; mdcTopAppBar__section_alignStart; with: [
				html span mdcTopAppBar__title; with: self title.
				self startSection ifNotNil: [ :value | html render: value ] ].
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
MDSTopAppBar >> startSection [

	^ startSection
]

{ #category : #accessing }
MDSTopAppBar >> startSection: anObject [

	startSection := anObject
]

{ #category : #accessing }
MDSTopAppBar >> title [

	^ title
]

{ #category : #accessing }
MDSTopAppBar >> title: anObject [

	title := anObject
]
