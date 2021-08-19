Class {
	#name : #MCWColorComponent,
	#superclass : #MCWTextInputComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWColorComponent >> inputType [

	^ 'color'
]

{ #category : #rendering }
MCWColorComponent >> renderViewerOn: html [
	| element |

	element := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | element class: eachCssClass ].
	element mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			html textInput mdcTextField__input;
				ariaDescribedBy: self labelId;
				"type: self inputType;"
				style: 'background: ', (self magritteDescription stringWriter write: self value description: self magritteDescription);
				readonly: true.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWColorComponent >> xrenderInputOn: html [
	html colorInput
		id: self labelId;
		on: #string of: self
]
