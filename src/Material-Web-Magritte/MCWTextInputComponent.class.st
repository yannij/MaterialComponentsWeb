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
MCWTextInputComponent >> renderViewerOn: html [

	self renderFieldWith: true on: html

]
