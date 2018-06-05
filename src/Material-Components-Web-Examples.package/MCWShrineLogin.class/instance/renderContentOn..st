rendering
renderContentOn: html 

	html div class: 'shrine-login'; with: [
		html div class: 'mdc-layout-grid'; with: [
			html div class: 'mdc-layout-grid__inner'; with: [
				html div class: 'mdc-layout-grid__cell grid-padding-off-mobile'; mdcLayoutGrid__cell__span1.
				html div class: 'mdc-layout-grid__cell grid-padding-off-mobile'; mdcLayoutGrid__cell__span1.
				html div class: 'mdc-layout-grid__cell grid-padding-off-tablet'; mdcLayoutGrid__cell__span1.
				html div class: 'mdc-layout-grid__cell grid-padding-off-tablet'; mdcLayoutGrid__cell__span1.
				html div class: 'mdc-layout-grid__cell'; with: [
					self renderLogoOn: html.
					self renderFormOn: html]]]]