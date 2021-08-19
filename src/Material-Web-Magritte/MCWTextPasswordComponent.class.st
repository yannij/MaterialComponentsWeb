Class {
	#name : #MCWTextPasswordComponent,
	#superclass : #MATextPasswordComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWTextPasswordComponent >> htmlIdPassword [

	^ self ajaxId, '-password'
]

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

	self renderFieldOn: html readonly: false

]

{ #category : #rendering }
MCWTextPasswordComponent >> renderFieldOn: html readonly: aReadonlyFlag [
	| element |

	element := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | element class: eachCssClass ].
	element
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			html passwordInput mdcTextField__input;
				id: self htmlIdPassword;
				ariaDescribedBy: self labelId;
				readonly: aReadonlyFlag;
				on: self inputAspect of: self.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWTextPasswordComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true

]
