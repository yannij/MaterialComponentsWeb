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

	self renderFieldWith: false on: html

]

{ #category : #rendering }
MCWTextInputComponent >> renderFieldWith: aReadonlyFlag on: html [
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
				"title: (self perform: self inputAspect);"
				type: self inputType;
				readonly: aReadonlyFlag;
				on: self inputAspect of: self.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWTextInputComponent >> renderViewerOn: html [

	self renderFieldWith: true on: html

]
