Class {
	#name : #MCWTextAreaComponent,
	#superclass : #MATextAreaComponent,
	#instVars : [
		'mdsFieldHeight'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #initialization }
MCWTextAreaComponent >> initialize [

	super initialize.

	self mdsFieldHeight: 2
]

{ #category : #rendering }
MCWTextAreaComponent >> inputAspect [

	^ #string
]

{ #category : #rendering }
MCWTextAreaComponent >> inputType [

	^ 'text'
]

{ #category : #accessing }
MCWTextAreaComponent >> mdsFieldHeight [

	^ mdsFieldHeight
]

{ #category : #accessing }
MCWTextAreaComponent >> mdsFieldHeight: anObject [

	mdsFieldHeight := anObject
]

{ #category : #accessing }
MCWTextAreaComponent >> mdsFieldHeightGet [

	^ self mdsFieldHeight max: 3
]

{ #category : #rendering }
MCWTextAreaComponent >> renderEditorOn: html [

	self renderFieldOn: html readonly: false

]

{ #category : #rendering }
MCWTextAreaComponent >> renderFieldOn: html readonly: aReadonlyFlage [
	| element fieldHeight gap |

	element := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | element class: eachCssClass ].
	fieldHeight := self mdsFieldHeightGet.
	gap := 2.
	element
		style: 'height: ', ((56 * fieldHeight) + (gap * (fieldHeight - 1))) printString, 'px';
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		mdcTextField_textarea;
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			html textArea mdcTextField__input;
				ariaDescribedBy: self labelId;
				style: 'height: calc(100% - 24px)';
				readonly: aReadonlyFlage;
				on: self inputAspect of: self.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWTextAreaComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true

]
