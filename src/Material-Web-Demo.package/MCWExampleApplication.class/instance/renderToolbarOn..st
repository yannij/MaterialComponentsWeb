rendering
renderToolbarOn: html

	html header
		class: 'mdc-toolbar'; class: 'mdc-elevation--z4';
		with: [
			html div class: 'mdc-toolbar__row'; with: [
				html section
					class: 'mdc-toolbar__section'; class: 'mdc-toolbar__section--align-start';
					with: [
						html button
							class: 'demo-menu'; class: 'material-icons'; class: 'mdc-toolbar__menu-icon';
							onClick: (JSScript new add: 'drawer.open = !drawer.open;');
							with: [html text: 'menu'].
						html span
							class: 'mdc-toolbar__title'; class: 'catalog-title';
							with: [html text: 'Persistent Drawer']]]].
