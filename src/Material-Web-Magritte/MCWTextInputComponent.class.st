Class {
	#name : #MCWTextInputComponent,
	#superclass : #MATextInputComponent,
	#category : 'Material-Web-Magritte'
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

	html label
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
				on: self inputAspect of: self.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWTextInputComponent >> renderViewerOn: html [

	self renderFieldOn: html

]
