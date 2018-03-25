rendering
renderCssOnlyOn: html

	html button
		id: self id;
		class: 'mdc-fab material-icons';
		class: 'mdc-fab--mini' if: self isMiniFab;
		style: 'position: absolute; right: 1rem; z-index: 1';
		style: self bottomStyle;
		with: [
			html span class: 'mdc-fab__icon'; with: 'add'].
