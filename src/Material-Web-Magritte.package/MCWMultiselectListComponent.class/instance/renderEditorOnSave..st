rendering
renderEditorOnSave: html

	html div
		"style: 'height: 128px';"
		"mdcSelect;"
		mdcFormField;
		mcwFormField;
		with: [
			html label
				mdcFloatingLabel;
				mdcFloatingLabel_floatAbove;
				"style: 'top: 33px';"
				"mdcAutoInit: 'MDCFloatingLabel';"
				for: self labelId;
				with: self magritteDescription label.

			html multiSelect
				mdcSelect__nativeControl;
				size:84;
				"style: 'height: 128px';"
				id: self labelId;
				list: self availableList;
				selected: self selectedList;
				labels: [ :value | self labelForOption: value ];
				callback: [ :value | self value: value ].

			html div mdcLineRipple]
