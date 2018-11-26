rendering - catalog page
renderDemoContentOn: html

	html div class: 'demo-content'; mdcDrawerAppContent; mdcTopAppBar_fixedAdjust; with: [
		html div class: 'demo-content-transition'; with: [
			html section class: 'loadComponent-enter-done'; with: [
				self renderCatalogPage: self pageName on: html]]]