Class {
	#name : #MCWFileUploadComponent,
	#superclass : #MAFileUploadComponent,
	#category : 'Material-Web-Magritte'
}

{ #category : #rendering }
MCWFileUploadComponent >> renderEditorOn: html [

	self renderViewerOn: html
]

{ #category : #rendering }
MCWFileUploadComponent >> renderFieldOn: html [

	html label
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		mcwFormField;
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			"html textInput mdcTextField__input;
				ariaDescribedBy: self labelId;
				on: self inputAspect of: self."
			html textInput type: 'hidden'; value: self value; callback: (GRDelayedSend receiver: self selector: #yourself).
			self requiresMultipartForm
				ifTrue: [ self renderUploadOn: html ]
				ifFalse: [ self renderRemoveOn: html ].
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWFileUploadComponent >> renderViewerOn: html [

	self renderFieldOn: html.

]
