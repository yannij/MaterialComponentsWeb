Class {
	#name : #MDSListItem,
	#superclass : #MDSComponent,
	#instVars : [
		'label',
		'icon',
		'callbackBlock',
		'active'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #'instance creation' }
MDSListItem class >> iconName: aMaterialIconName itemText: aString callback: aBlock [

	^ self label: aString icon: aMaterialIconName callback: aBlock
]

{ #category : #'instance creation' }
MDSListItem class >> itemText: aString [

	^ self label: aString icon: nil callback: nil
]

{ #category : #'instance creation' }
MDSListItem class >> itemText: aString callback: aBlock [

	^ self label: aString icon: nil callback: aBlock
]

{ #category : #'instance creation' }
MDSListItem class >> itemText: aString iconName: aMaterialIconName callback: aBlock [

	^ self label: aString icon: aMaterialIconName callback: aBlock
]

{ #category : #'instance creation' }
MDSListItem class >> label: aString [

	^ self label: aString icon: nil callback: nil
]

{ #category : #'instance creation' }
MDSListItem class >> label: aString callback: aBlock [

	^ self label: aString icon: nil callback: aBlock
]

{ #category : #'instance creation' }
MDSListItem class >> label: aString icon: anIconName callback: aBlock [

	^ self new
		label: aString;
		icon: anIconName;
		callbackBlock: aBlock;
		yourself
]

{ #category : #accessing }
MDSListItem >> active [

	^ active
]

{ #category : #accessing }
MDSListItem >> active: anObject [

	active := anObject
]

{ #category : #accessing }
MDSListItem >> callbackBlock [

	^ callbackBlock
]

{ #category : #accessing }
MDSListItem >> callbackBlock: anObject [

	callbackBlock := anObject
]

{ #category : #accessing }
MDSListItem >> icon [

	^ icon
]

{ #category : #accessing }
MDSListItem >> icon: anObject [

	icon := anObject
]

{ #category : #initialization }
MDSListItem >> initialize [

	super initialize.

	self active: false
]

{ #category : #accessing }
MDSListItem >> label [

	^ label
]

{ #category : #accessing }
MDSListItem >> label: anObject [

	label := anObject
]

{ #category : #rendering }
MDSListItem >> renderContentOn: html [

	self renderListItemOn: html
]

{ #category : #rendering }
MDSListItem >> renderListItemOn: html [
	| itemTag |

	(itemTag := html anchor) mdcDeprecatedListItem;
		id: html nextId;
		callback: self callbackBlock if: self callbackBlock notNil;
		with: [
			html span mdcDeprecatedListItem__ripple.
			self icon ifNotNil: [ :value |
				html span mdcDeprecatedListItem__graphic; mdcMaterialIcons; with: value ].
			html span mdcDeprecatedListItem__text; with: self label ].

	self active ifTrue: [
		html script: (html jQuery script: [ :s | s
			<< ((s jQuery id: itemTag id) call: 'addClass' with: 'mdc-deprecated-list-item--selected') ]) ]
]
