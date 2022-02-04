Class {
	#name : #MDQTextPasswordComponent,
	#superclass : #MATextPasswordComponent,
	#category : #'Quasar-Magritte'
}

{ #category : #rendering }
MDQTextPasswordComponent >> htmlIdPassword [

	^ self ajaxId, '-password'
]

{ #category : #rendering }
MDQTextPasswordComponent >> inputAspect [

	^ #string
]

{ #category : #rendering }
MDQTextPasswordComponent >> inputType [

	^ 'password'
]

{ #category : #rendering }
MDQTextPasswordComponent >> renderEditorOn: html [

	self renderFieldOn: html readonly: false

]

{ #category : #rendering }
MDQTextPasswordComponent >> renderFieldFilledOn: html readonly: aReadonlyFlag [
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
MDQTextPasswordComponent >> renderFieldOn: html readonly: aReadonlyFlag [

	self mdsTextFieldStyleIsFilled
		ifTrue: [ self renderFieldFilledOn: html readonly: aReadonlyFlag ]
		ifFalse: [ self renderFieldOutlinedOn: html readonly: aReadonlyFlag ]
]

{ #category : #rendering }
MDQTextPasswordComponent >> renderFieldOutlinedOn: html readonly: aReadonlyFlag [
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
MDQTextPasswordComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true

]
