rendering
renderEditorOn: html

	html div
		mdcSelect;
		mcwFormField;
		with: [
			html select
				mdcSelect__nativeControl;
				id: self labelId;
				list: self options;
				selected: self value;
				callback: [ :value | self value: value ];
				labels: [ :value | self labelForOption: value ].

			html label
				mdcFloatingLabel;
				mdcFloatingLabel_floatAbove;
				for: 'select-box';
				with: self magritteDescription label.

			html div mdcLineRipple]