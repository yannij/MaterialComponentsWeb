rendering
renderFieldOn: html
"
	html mdlTextFieldContainer floatingLabel; with: [
		html mdlTextFieldInput
			id: self labelId; type: 'hidden'; value: self value; callback: (GRDelayedSend receiver: self selector: #yourself).
		html mdlTextFieldLabel
			for: self labelId; with: self magritteDescription label.
		self requiresMultipartForm
			ifTrue: [ self renderUploadOn: html ]
			ifFalse: [ self renderRemoveOn: html ]
	].
"
	html div
		mdcTextField;
		mcwFormField;
		with: [
			html textInput
				type: 'hidden'; value: self value; callback: (GRDelayedSend receiver: self selector: #yourself).
			self requiresMultipartForm
				ifTrue: [ self renderUploadOn: html ]
				ifFalse: [ self renderRemoveOn: html ].
			html label
				for: self labelId;
				mdcFloatingLabel;
				mdcFloatingLabel_floatAbove;
				with: self magritteDescription label]
