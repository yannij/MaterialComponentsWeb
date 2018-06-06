rendering
renderEditorOn: html

	html div
		style: 'height: 128px';
		mdcSelect;
		mdcSelect__box;
		mdcRippleUpgraded;
		style: '--mdc-ripple-fg-size:106.2px; --mdc-ripple-fg-scale:1.84226; --mdc-ripple-fg-translate-start:27.884px, -24.412px; --mdc-ripple-fg-translate-end:35.4px, -25.1px;';
		with: [
			html multiSelect
				class: 'mdc-select__native-control';
				size: 8;
				style: 'height: 128px';
				id: self labelId;
				list: self availableList;
				selected: self selectedList;
				labels: [ :value | self labelForOption: value ];
				callback: [ :value | self value: value ].

			html label
				mdcFloatingLabel;
				mdcFloatingLabel__floatAbove;
				style: 'top: 33px';
				"for: 'select-box';"
				with: self magritteDescription label.

			html div mdcLineRipple]
