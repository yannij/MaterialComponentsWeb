Class {
	#name : #MCWCheckboxComponent,
	#superclass : #MACheckboxComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWCheckboxComponent >> renderCheckboxOn: html  readonly: readonlyFlag [
	| checkboxId checkboxTag |

	checkboxId := html nextId.

	html div mdcTouchTargetWrapper; with: [
		checkboxTag := html div mdcCheckbox; mdcCheckbox_touch; yourself.
		readonlyFlag ifTrue: [ checkboxTag mdcCheckbox_disabled ].
		checkboxTag style: 'margin-top: 16px'; with: [
			html checkbox
				id: checkboxId;
				mdcTextField__input; "to avoid error during: MDCTextField.initialize"
				mdcCheckbox__nativeControl;
				disabled: readonlyFlag;
				on: #value of: self;
				with: nil.
			html div mdcCheckbox__background with: [
				html svg mdcCheckbox__checkmark; attributeAt: 'viewBox' put: '0 0 24 24'; with: [
				html path
					mdcCheckbox__checkmarkPath;
					attributeAt: 'fill' put: 'none';
					attributeAt: 'stroke' put: 'white';
					attributeAt: 'd' put: 'M1.73,12.91 8.1,19.28 22.79,4.59';
					yourself.
				html div mdcCheckbox__mixedmark ] ].
			html div mdcCheckbox__ripple ] ]
]

{ #category : #rendering }
MCWCheckboxComponent >> renderEditorOn: html [

	self renderFieldOn: html readonly: false
]

{ #category : #rendering }
MCWCheckboxComponent >> renderFieldOn: html readonly: readonlyFlag [
	| labelTag |

	labelTag := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | labelTag class: eachCssClass ].
	labelTag mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			self renderCheckboxOn: html readonly: readonlyFlag.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWCheckboxComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true
]
