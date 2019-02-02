rendering
renderEditorOn: html

	html div
		style: 'height: 128px';
		mdcSelect;
		mcwFormField;
		with: [
			html multiSelect
				mdcSelect__nativeControl;
				size: 8;
				style: 'height: 128px';
				id: self labelId;
				list: self availableList;
				selected: self selectedList;
				labels: [ :value | self labelForOption: value ];
				callback: [ :value | self value: value ].

			html label
				mdcFloatingLabel;
				mdcFloatingLabel_floatAbove;
				"style: 'top: 33px';"
				"for: 'select-box';"
				with: self magritteDescription label.

			html div mdcLineRipple]
