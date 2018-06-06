rendering
renderContentOn: html

	html div
		mdcMenuAnchor;
		with: [
			html div
				mdcMenu;
				id: self id;
				mdcAutoInit: 'MDCMenu';
				with: [self renderMenuItemsOn: html]]
	