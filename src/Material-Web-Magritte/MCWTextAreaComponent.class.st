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
MCWTextAreaComponent >> renderFieldFilledOn: html readonly: aReadonlyFlage [
	| element |

	element := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | element class: eachCssClass ].
	element
		style: 'height: ', (self mdsTextFieldHeightOf: self mdsFieldHeightGet) printString, 'px';
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
MCWTextAreaComponent >> renderFieldOn: html readonly: aReadonlyFlag [

	self mdsTextFieldStyleIsFilled
		ifTrue: [ self renderFieldFilledOn: html readonly: aReadonlyFlag ]
		ifFalse: [ self renderFieldOutlinedOn: html readonly: aReadonlyFlag ].

	self renderTextFieldHelpTextOn: html
]

{ #category : #rendering }
MCWTextAreaComponent >> renderFieldOutlinedOn: html readonly: aReadonlyFlage [
	| element |

	element := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | element class: eachCssClass ].
	element style: 'background: ', self mdsTextFieldBackground.
	element
		style: 'height: ', (self mdsTextFieldHeightOf: self mdsFieldHeightGet) printString, 'px';
		mdcTextField; mdcTextField_outlined; mdcAutoInit: 'MDCTextField';
		mdcTextField_textarea;
		with: [
			html span mdcNotchedOutline with: [
				html span mdcNotchedOutline__leading.
				html span mdcNotchedOutline__notch; style: 'width: 100%'; with: [
					html span mdcFloatingLabel;
						style: 'width: 100%';
						id: self labelId;
						with: self magritteDescription label.
				html span mdcNotchedOutline__trailing ] ].
			html textArea mdcTextField__input;
				ariaDescribedBy: self labelId;
				style: 'padding-top: 12px';
				style: 'height: calc(100% - 24px)';
				readonly: aReadonlyFlage;
				on: self inputAspect of: self ]
]

{ #category : #rendering }
MCWTextAreaComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true

]
