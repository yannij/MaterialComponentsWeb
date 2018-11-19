rendering
renderRootOn: html

	html div id: 'root'; with: [
		html div class: 'catalog-page-container'; with: [
			self renderHeaderOn: html.
			self isHomePage
				ifTrue: [self renderLandingPageOn: html]
				ifFalse: [self renderDemoPanelOn: html]]]
