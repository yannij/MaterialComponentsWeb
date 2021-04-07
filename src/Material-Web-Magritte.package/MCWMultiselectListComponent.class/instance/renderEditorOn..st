rendering
renderEditorOn: html

	html label
		style: 'height: 160px';
		mcwFormField;
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				style: 'height: 64px';
				id: self labelId;
				with: self magritteDescription label.

			html multiSelect
				mdcSelect__nativeControl;
				size: 8;
				style: 'height: 128px';
				id: self labelId;
				list: self availableList;
				selected: self selectedList;
				labels: [ :value | self labelForOption: value ];
				callback: [ :value | self value: value ].

			html textInput mdcTextField__input.
			html span mdcLineRipple  ]
