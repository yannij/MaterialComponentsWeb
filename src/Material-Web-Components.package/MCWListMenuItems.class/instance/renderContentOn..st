rendering
renderContentOn: html

	html div
		mdcMenuAnchor;
		with: [
			html div
				mdcMenu;
				class: 'mdc-menu-surface';
				id: self id;
				mdcAutoInit: 'MDCMenu';
				with: [self renderMenuItemsOn: html]]
	