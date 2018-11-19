rendering - catalog page
renderDemoContentOn: html

	html div class: 'demo-content mdc-drawer-app-content mdc-top-app-bar--fixed-adjust'; with: [
		html div class: 'demo-content-transition'; with: [
			html section class: 'loadComponent-enter-done'; with: [
				self renderCatalogPage: self pageName on: html]]]