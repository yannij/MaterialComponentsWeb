rendering
renderMagritteViewerOn: html

	html div mdcFormField; with: [
	html div
		mdcTextField;
		mdcTextField__fullwidth;
		mdcTextField__upgraded; with: [
			html label
				for: self labelId;
				mdcFloatingLabel;
				mdcFloatingLabel__floatAbove;
				with: self magritteDescription label.
			"html textInput
				readonly: true;
				mdcTextField__input;
				id: self labelId; type: 'text'; with: ''."
			html div id: self labelId; with: [super renderViewerOn: html]]]