Class {
	#name : #MDSDrawer,
	#superclass : #MCWComponent,
	#instVars : [
		'title',
		'subtitle',
		'header',
		'content',
		'modal',
		'dismissible',
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

{ #category : #rendering }
MDSDrawer >> addFixedAdjust: anHtmlTag [

	self fixedAdjust notNil ifTrue: [ anHtmlTag mdcTopAppBar_fixedAdjust ]
]

{ #category : #accessing }
MDSDrawer >> content [

	^ content
]

{ #category : #accessing }
MDSDrawer >> content: anObject [

	content := anObject
]

{ #category : #accessing }
MDSDrawer >> dismissible [

	^ dismissible
]

{ #category : #accessing }
MDSDrawer >> dismissible: anObject [

	dismissible := anObject
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

	self modal: false.
	self dismissible: false
]

{ #category : #accessing }
MDSDrawer >> modal [

	^ modal
]

{ #category : #accessing }
MDSDrawer >> modal: anObject [

	modal := anObject
]

{ #category : #rendering }
MDSDrawer >> renderContentOn: html [

	self renderDrawerOn: html
]

{ #category : #rendering }
MDSDrawer >> renderDrawerContentOn: html [

	html div mdcDrawer__content with: [
		html navigation with: [
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
	self addFixedAdjust: tag.
	tag with: [
		self renderDrawerHeaderOn: html.
		self renderDrawerContentOn: html ]
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
