rendering
renderMagritteViewerOn: html

	html div
		mdcTextField;
		"mdcTextField_fullwidth;"
		with: [
			html label
				for: self labelId;
				mdcFloatingLabel;
				mdcFloatingLabel_floatAbove;
				with: self magritteDescription label.
			"html textInput
				readonly: true;
				mdcTextField__input;
				id: self labelId; type: 'text'; with: ''."
			html div id: self labelId; with: [super renderViewerOn: html]]