Class {
	#name : #MDQTextInputComponent,
	#superclass : #MATextInputComponent,
	#category : #'Quasar-Magritte'
}

{ #category : #rendering }
MDQTextInputComponent >> inputAspect [

	^ #string
]

{ #category : #rendering }
MDQTextInputComponent >> inputType [

	^ 'text'
]

{ #category : #rendering }
MDQTextInputComponent >> renderEditorOn: html [

	self renderFieldOn: html readonly: false
]

{ #category : #rendering }
MDQTextInputComponent >> renderFieldOn: html readonly: aReadonlyFlag [
	| inputTag inputLabel inputValue |

	inputLabel := self magritteDescription label.
	inputValue := self perform: self inputAspect.

	inputTag := html qInput.
	"self mdsTextFieldStyleIsFilled" false
		ifTrue: [ inputTag filled ]
		ifFalse: [ inputTag outlined ].

	inputTag type: self inputType; label: inputLabel.

	aReadonlyFlag
		ifTrue: [
			inputTag readonly: true; modelValue: inputValue ]
		ifFalse: [ | modelName |
			modelName := inputLabel asCamelCase uncapitalized.
			self mdqApplicationGet vueRefsAdd: modelName -> inputValue.
			inputTag "name: modelName;" vModel: modelName.
			inputTag on: self inputAspect of: self
		].

	"self renderTextFieldHelpTextOn: html"
]

{ #category : #rendering }
MDQTextInputComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true
]
