rendering
renderTopAppBarRowOn: html

	html div class: 'mdc-top-app-bar__row'; with: [
		html section class: 'mdc-top-app-bar__section mdc-top-app-bar__section--align-start'; with: [
			html button
				class: 'material-icons mdc-top-app-bar__navigation-icon mdc-ripple-upgraded mdc-ripple-upgraded--unbounded';
				title: 'Home';
				style: '--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;';
				with: [
					self isHomePage
						ifTrue: [self renderMaterialLogoOn: html]
						ifFalse: [self renderMenuIconOn: html]].

			html span class: 'mdc-top-app-bar__title catalog-top-app-bar__title'; with: [
				html span class: 'catalog-top-app-bar__title--small-screen'; with: 'MDC Web'.
				html span class: 'catalog-top-app-bar__title--large-screen'; with: 'Material Components for the Web']]]
