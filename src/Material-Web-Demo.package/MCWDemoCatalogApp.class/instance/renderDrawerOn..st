rendering - catalog page
renderDrawerOn: html

	html aside id: 'demo-drawer'; class: 'mdc-drawer mdc-drawer--dismissible demo-drawer mdc-top-app-bar--fixed-adjust'; with: [
		html div class: 'mdc-drawer__header demo-drawer-header'; with: [
			html html: '<img src="https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg" class="resources-icon" alt="Material Design Guidelines icon">'].
		html div class: 'mdc-drawer__content'; with: [
			self renderNavOn: html]]