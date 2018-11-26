page - button
renderButtonHeroOn: html

	html div class: 'hero'; with: [
		html div with: [
			html button type: ''; class: 'hero-button'; mdcButton; mdcRippleUpgraded; with: 'Text'.
			html button type: ''; class: 'hero-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: 'Raised'.
			html button type: ''; class: 'hero-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: 'Unelevated'.
			html button type: ''; class: 'hero-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: 'Outlined'.
		]
	]
