Class {
	#name : #MCWTextInputComponent,
	#superclass : #MATextInputComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWTextInputComponent >> inputAspect [

	^ #string
]

{ #category : #rendering }
MCWTextInputComponent >> inputType [

	^ 'text'
]

{ #category : #rendering }
MCWTextInputComponent >> renderEditorOn: html [

	self renderViewerOn: html

]

{ #category : #rendering }
MCWTextInputComponent >> renderFieldOn: html [
	| element |

	element := html label.
	element
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			html textInput mdcTextField__input;
				ariaDescribedBy: self labelId;
				"title: (self perform: self inputAspect);"
				type: self inputType;
				attributeAt: 'step' put: '1';
				disabled: self magritteDescription isReadonly;
				on: self inputAspect of: self.
			html span mdcLineRipple ].
	self magritteDescription isReadonly ifTrue: [
		element mdcTextField_disabled ]
]

{ #category : #rendering }
MCWTextInputComponent >> renderViewerOn: html [

	self renderFieldOn: html

]
