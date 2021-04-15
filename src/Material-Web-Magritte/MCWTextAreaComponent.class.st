Class {
	#name : #MCWTextAreaComponent,
	#superclass : #MATextAreaComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWTextAreaComponent >> inputAspect [

	^ #string
]

{ #category : #rendering }
MCWTextAreaComponent >> inputType [

	^ 'text'
]

{ #category : #rendering }
MCWTextAreaComponent >> renderEditorOn: html [

	self renderViewerOn: html

]

{ #category : #rendering }
MCWTextAreaComponent >> renderFieldOn: html [
	| element |

	element := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | element class: eachCssClass ].
	element
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		mcwFormField; mdcTextField_textarea;
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			html textArea mdcTextField__input;
				ariaDescribedBy: self labelId;
				on: self inputAspect of: self.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWTextAreaComponent >> renderViewerOn: html [

	self renderFieldOn: html

]
