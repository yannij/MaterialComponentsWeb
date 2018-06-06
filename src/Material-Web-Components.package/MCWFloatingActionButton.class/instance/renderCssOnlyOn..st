rendering
renderCssOnlyOn: html

	html button
		id: self id;
		mdcMaterialIcons;
		mdcFab;
		mdcFab__mini_if: self isMiniFab;
		style: 'position: absolute; right: 1rem; z-index: 1';
		style: self bottomStyle;
		with: [
			html span mdcFab__icon: 'add'].
