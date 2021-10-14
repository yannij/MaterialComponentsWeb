Class {
	#name : #MDSTab,
	#superclass : #MDSComponent,
	#instVars : [
		'label',
		'icon',
		'callbackBlock',
		'active',
		'showLabel',
		'showIcon',
		'showStacked'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #'instance creation' }
MDSTab class >> label: aString [

	^ self label: aString icon: nil callback: nil
]

{ #category : #'instance creation' }
MDSTab class >> label: aString callback: aBlock [

	^ self label: aString icon: nil callback: aBlock
]

{ #category : #'instance creation' }
MDSTab class >> label: aString icon: anIconName callback: aBlock [

	^ self new
		label: aString;
		icon: anIconName;
		callbackBlock: aBlock;
		yourself
]

{ #category : #accessing }
MDSTab >> active [

	^ active
]

{ #category : #accessing }
MDSTab >> active: anObject [

	active := anObject
]

{ #category : #accessing }
MDSTab >> callbackBlock [

	^ callbackBlock
]

{ #category : #accessing }
MDSTab >> callbackBlock: anObject [

	callbackBlock := anObject
]

{ #category : #accessing }
MDSTab >> icon [

	^ icon
]

{ #category : #accessing }
MDSTab >> icon: anObject [

	icon := anObject
]

{ #category : #initialization }
MDSTab >> initialize [

	super initialize.

	self showLabel: true.
	self showIcon: true.
	self showStacked: false.
	self active: false
]

{ #category : #accessing }
MDSTab >> label [

	^ label
]

{ #category : #accessing }
MDSTab >> label: anObject [

	label := anObject
]

{ #category : #rendering }
MDSTab >> renderContentOn: html [

	self renderTabOn: html
]

{ #category : #rendering }
MDSTab >> renderTabOn: html [
	| tagTab tagTabIndicator |

	tagTab := html anchor mdcTab. "mdcAutoInit: 'MDCTab';"
	self showStacked ifTrue: [ tagTab mdcTab_stacked ].
	tagTab
		id: html nextId;
		callback: self callbackBlock if: self callbackBlock notNil;
		with: [
			html span mdcTab__content; with: [
				self showIcon ifTrue: [
					html span mdcTab__icon; mdcMaterialIcons; with: self icon ].
				self showLabel ifTrue: [
					html span mdcTab__textLabel; with: self label ] ].
			(tagTabIndicator := html span)
				mdcTabIndicator;
				id: html nextId;
				with: [
					html span mdcTabIndicator__content; mdcTabIndicator__content_underline ].
			html span mdcTab__ripple; mdcRippleUpgraded ].

	self active ifTrue: [
		html script: (html jQuery script: [ :s | s
			<< ((s jQuery id: tagTab id) call: 'focus');
			<< ((s jQuery id: tagTabIndicator id) call: 'addClass' with: 'mdc-tab-indicator--active') ]) ]
]

{ #category : #accessing }
MDSTab >> showIcon [

	^ showIcon
]

{ #category : #accessing }
MDSTab >> showIcon: anObject [

	showIcon := anObject
]

{ #category : #accessing }
MDSTab >> showLabel [

	^ showLabel
]

{ #category : #accessing }
MDSTab >> showLabel: anObject [

	showLabel := anObject
]

{ #category : #accessing }
MDSTab >> showStacked [

	^ showStacked
]

{ #category : #accessing }
MDSTab >> showStacked: anObject [

	showStacked := anObject
]
