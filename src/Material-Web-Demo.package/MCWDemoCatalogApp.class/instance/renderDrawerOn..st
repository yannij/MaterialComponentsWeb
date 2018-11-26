rendering - catalog page
renderDrawerOn: html

	html aside id: 'demo-drawer'; mdcDrawer; mdcDrawer_dismissible; class: 'demo-drawer'; mdcTopAppBar_fixedAdjust; with: [
		html div mdcDrawer__header; class: 'demo-drawer-header'; with: [
			html image
				url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg';
				class: 'resources-icon';
				altText: 'Material Design Guidelines icon'].
		html div mdcDrawer__content; with: [
			self renderNavOn: html]]