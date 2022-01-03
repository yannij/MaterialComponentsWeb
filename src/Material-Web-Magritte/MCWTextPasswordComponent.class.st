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
MCWTextPasswordComponent >> renderFieldFilledOn: html readonly: aReadonlyFlag [
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
MCWTextPasswordComponent >> renderFieldOn: html readonly: aReadonlyFlag [

	self mdsTextFieldStyleIsFilled
		ifTrue: [ self renderFieldFilledOn: html readonly: aReadonlyFlag ]
		ifFalse: [ self renderFieldOutlinedOn: html readonly: aReadonlyFlag ]
]

{ #category : #rendering }
MCWTextPasswordComponent >> renderFieldOutlinedOn: html readonly: aReadonlyFlag [
	| element |

	element := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | element class: eachCssClass ].
	element
		mdcTextField; mdcTextField_outlined; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcNotchedOutline with: [
				html span mdcNotchedOutline__leading.
				html span mdcNotchedOutline__notch; with: [
					html span mdcFloatingLabel;
						id: self labelId;
						with: self magritteDescription label.
				html span mdcNotchedOutline__trailing ] ].
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
