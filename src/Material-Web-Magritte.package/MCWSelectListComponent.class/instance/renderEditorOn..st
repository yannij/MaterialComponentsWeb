rendering
renderEditorOn: html

	html div
		mdcSelect;
		mdcSelect__box;
		mdcRippleUpgraded;
		style: '--mdc-ripple-fg-size:106.2px; --mdc-ripple-fg-scale:1.84226; --mdc-ripple-fg-translate-start:27.884px, -24.412px; --mdc-ripple-fg-translate-end:35.4px, -25.1px;';
		with: [
			html select
				class: 'mdc-select__native-control';
				id: self labelId;
				list: self options;
				selected: self value;
				callback: [ :value | self value: value ];
				labels: [ :value | self labelForOption: value ].

			html label
				mdcFloatingLabel;
				mdcFloatingLabel__floatAbove;
				for: 'select-box';
				with: self magritteDescription label.

			html div mdcLineRipple]
