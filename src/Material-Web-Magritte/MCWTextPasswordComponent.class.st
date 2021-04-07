Class {
	#name : #MCWTextPasswordComponent,
	#superclass : #MATextPasswordComponent,
	#category : 'Material-Web-Magritte'
}

{ #category : #rendering }
MCWTextPasswordComponent >> inputAspect [

	^ #string
]

{ #category : #rendering }
MCWTextPasswordComponent >> inputType [

	^ 'password'
]

{ #category : #rendering }
MCWTextPasswordComponent >> renderEditorOn: html [

	self renderViewerOn: html

]

{ #category : #rendering }
MCWTextPasswordComponent >> renderFieldOn: html [

	html label
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			html textInput mdcTextField__input;
				ariaDescribedBy: self labelId;
				on: self inputAspect of: self.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWTextPasswordComponent >> renderViewerOn: html [

	self renderFieldOn: html

]
