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

	self renderFieldOn: html readonly: false
]

{ #category : #rendering }
MCWTextInputComponent >> renderFieldFilledOn: html readonly: aReadonlyFlag [
	| labelTag inputTag |

	labelTag := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | labelTag class: eachCssClass ].
	labelTag mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			inputTag := html textInput mdcTextField__input;
				ariaDescribedBy: self labelId;
				"title: (self perform: self inputAspect);"
				type: self inputType;
				readonly: aReadonlyFlag;
				yourself.
			aReadonlyFlag
				ifTrue: [ inputTag on: self inputAspect ofNoCallback: self ]
				ifFalse: [ inputTag on: self inputAspect of: self ].
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWTextInputComponent >> renderFieldOn: html readonly: aReadonlyFlag [

	self mdsTextFieldStyleIsFilled
		ifTrue: [ self renderFieldFilledOn: html readonly: aReadonlyFlag ]
		ifFalse: [ self renderFieldOutlinedOn: html readonly: aReadonlyFlag ]
]

{ #category : #rendering }
MCWTextInputComponent >> renderFieldOutlinedOn: html readonly: aReadonlyFlag [
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
				ariaDescribedBy: self labelId;
				type: self inputType;
				readonly: aReadonlyFlag;
				yourself.
			aReadonlyFlag
				ifTrue: [ inputTag on: self inputAspect ofNoCallback: self ]
				ifFalse: [ inputTag on: self inputAspect of: self ] ]
]

{ #category : #rendering }
MCWTextInputComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true
]
