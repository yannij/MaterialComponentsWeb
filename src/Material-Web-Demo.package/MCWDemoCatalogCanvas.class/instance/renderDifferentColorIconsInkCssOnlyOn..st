rendering - button
renderDifferentColorIconsInkCssOnlyOn: html

	html legend
		mdcTypography_title;
		with: 'Different Color Icons/Ink'.
		html div with: [
			html button
				mdcButton;
				mdcButton_unelevated;
				class: 'demo-ink-color';
				with: [
					html span mdcMaterialIcons; mdcButton_icon; with: 'favorite'.
					html text: 'Ink Color'].
			html button
				mdcButton;
				mdcButton_stroked;
				class: 'demo-icon-color';
				with: [
					html span mdcMaterialIcons; mdcButton_stroked; with: 'favorite'.
					html text: 'Icon Color']]
