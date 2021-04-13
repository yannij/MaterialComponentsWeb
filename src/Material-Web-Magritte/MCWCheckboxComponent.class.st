Class {
	#name : #MCWCheckboxComponent,
	#superclass : #MACheckboxComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWCheckboxComponent >> renderEditorOn: html [

	self renderViewerOn: html
]

{ #category : #rendering }
MCWCheckboxComponent >> renderFieldOn: html [
	| checkboxId |

	checkboxId := html nextId.

	html div mdcFormField; mcwFormField; with: [
		html div mdcCheckbox; with: [
		html checkbox
			id: checkboxId;
			mdcCheckbox__nativeControl;
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
MCWCheckboxComponent >> renderViewerOn: html [

	self renderFieldOn: html
]
