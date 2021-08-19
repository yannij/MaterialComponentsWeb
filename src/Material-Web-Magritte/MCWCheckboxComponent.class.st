Class {
	#name : #MCWCheckboxComponent,
	#superclass : #MACheckboxComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWCheckboxComponent >> renderCheckboxOn: html  readonly: readonlyFlag [
	| checkboxId checkboxTag |

	checkboxId := html nextId.

	html div mdcFormField; mcwFormField; with: [
	checkboxTag := html div mdcCheckbox.
	readonlyFlag ifTrue: [ checkboxTag mdcCheckbox_disabled ].
	checkboxTag with: [
		html checkbox
			id: checkboxId;
			mdcCheckbox__nativeControl;
			disabled: readonlyFlag;
			on: #value of: self;
			with: [
				html div mdcCheckbox__background with: [
					html svg mdcCheckbox__checkmark; attributeAt: 'viewBox' put: '0 0 24 24'; with: [
					html path
						mdcCheckbox__checkmarkPath;
						attributeAt: 'fill' put: 'none';
						attributeAt: 'stroke' put: 'white';
						attributeAt: 'd' put: 'M1.73,12.91 8.1,19.28 22.79,4.59';
						yourself.
					html div mdcCheckbox__mixedmark ] ] ] ].
		html label
			for: checkboxId;
			"mdcFloatingLabel;
			mdcFloatingLabel_floatAbove;"
			with: self magritteDescription checkboxLabel ].

]

{ #category : #rendering }
MCWCheckboxComponent >> renderEditorOn: html [

	self renderFieldOn: html readonly: false
]

{ #category : #rendering }
MCWCheckboxComponent >> renderFieldOn: html readonly: readonlyFlag [

	html div
		mdcListGroup;
		style: 'border-bottom: 1px solid rgba(0, 0, 0, 0.4);';
		style: 'margin: 4px 4px 0 4px';
		"style: 'background: var(--mdc-theme-background)';"
		style: 'background-color: whitesmoke';
		with: [
			self renderCheckboxOn: html readonly: readonlyFlag ]
]

{ #category : #rendering }
MCWCheckboxComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true
]
