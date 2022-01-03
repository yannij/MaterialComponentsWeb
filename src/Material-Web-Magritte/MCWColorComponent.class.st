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
MCWColorComponent >> renderFieldFilledReadonlyOn: html [
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
				style: 'background: ', (self magritteDescription stringWriter write: self value description: self magritteDescription);
				readonly: true.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWColorComponent >> renderFieldOn: html readonly: aReadonlyFlag [

	self mdsTextFieldStyleIsFilled
		ifTrue: [ 
			aReadonlyFlag
				ifTrue: [ self renderFieldFilledReadonlyOn: html ]
				ifFalse: [ self renderFieldFilledOn: html readonly: aReadonlyFlag ] ]
		ifFalse: [ self renderFieldOutlinedOn: html readonly: aReadonlyFlag ]
]

{ #category : #rendering }
MCWColorComponent >> renderFieldOutlinedOn: html readonly: aReadonlyFlag [
	| labelTag inputTag |

	labelTag := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | labelTag class: eachCssClass ].
	labelTag mdcTextField; mdcTextField_outlined; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcNotchedOutline with: [
				html span mdcNotchedOutline__leading.
				html span mdcNotchedOutline__notch; with: [
					html span mdcFloatingLabel;
						id: self labelId;
						with: self magritteDescription label.
				html span mdcNotchedOutline__trailing ] ].
			inputTag := html textInput mdcTextField__input;
				style: 'padding-top: 8px';
				style: 'height: 48px';
				ariaDescribedBy: self labelId;
				type: self inputType;
				readonly: aReadonlyFlag;
				yourself.
			aReadonlyFlag
				ifTrue: [ inputTag on: self inputAspect ofNoCallback: self ]
				ifFalse: [ inputTag on: self inputAspect of: self ] ]
]

{ #category : #rendering }
MCWColorComponent >> xrenderInputOn: html [
	html colorInput
		id: self labelId;
		on: #string of: self
]
