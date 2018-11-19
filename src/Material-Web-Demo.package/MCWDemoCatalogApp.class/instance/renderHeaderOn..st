rendering
renderHeaderOn: html

	html header mdcTopAppBar; class: 'catalog-top-app-bar'; with: [
		self renderTopAppBarRowOn: html]