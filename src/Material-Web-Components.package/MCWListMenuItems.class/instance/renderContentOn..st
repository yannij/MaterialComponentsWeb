rendering
renderContentOn: html

	html div
		mdcMenuSurface_anchor;
		with: [
			html div
				mdcMenu;
				class: 'mdc-menu-surface';
				id: self id;
				mdcAutoInit: 'MDCMenu';
				with: [self renderMenuItemsOn: html]]
	