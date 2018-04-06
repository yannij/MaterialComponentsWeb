rendering - button
renderDifferentColorIconsInkCssOnlyOn: html

	html legend
		mdcTypography__title;
		with: 'Different Color Icons/Ink'.
		html div with: [
			html button
				mdcButton;
				mdcButton__unelevated;
				class: 'demo-ink-color';
				with: [
					html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
					html text: 'Ink Color'].
			html button
				mdcButton;
				mdcButton__stroked;
				class: 'demo-icon-color';
				with: [
					html span mdcMaterialIcons; mdcButton__stroked; with: 'favorite'.
					html text: 'Icon Color']]
