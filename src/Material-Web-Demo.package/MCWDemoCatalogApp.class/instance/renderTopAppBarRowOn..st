rendering
renderTopAppBarRowOn: html

	html div mdcTopAppBar__row; with: [
		html section mdcTopAppBar__section; mdcTopAppBar__section_alignStart; with: [
			html button
				mdcMaterialIcons; mdcTopAppBar__navigationIcon; mdcRippleUpgraded; mdcRippleUpgraded_unbounded;
				title: 'Home';
				with: [
					self isHomePage
						ifTrue: [self renderMaterialLogoOn: html]
						ifFalse: [self renderMenuIconOn: html]].

			html span mdcTopAppBar__title; class: 'catalog-top-app-bar__title'; with: [
				html span class: 'catalog-top-app-bar__title--small-screen'; with: 'MDC Web'.
				html span class: 'catalog-top-app-bar__title--large-screen'; with: 'Material Components for the Web']]]
