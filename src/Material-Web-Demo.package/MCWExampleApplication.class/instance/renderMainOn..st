rendering
renderMainOn: html

	(html tag: 'main')
		class: 'demo-main';
		with: [
			html heading
				level1;
				class: 'mdc-typography--display1';
				with: 'Persistent Drawer'.
			html paragraph
				class: 'mdc-typography--body1';
				with: 'Click the menu icon above to open and close the drawer.'.
			html div
				id: 'demo-radio-buttons'; class: 'theme-radio-buttons';
				onChange: (JSScript new add: (JSStream new
					nextPutAll: '
  drawerEl.classList.remove(''demo-drawer--custom'');
  drawerEl.classList.remove(''demo-drawer--accessible'');

  if(event.target.id === ''theme-radio-accessible'') {
    drawerEl.classList.add(''demo-drawer--accessible'');
  } else if(event.target.id === ''theme-radio-custom'') {
    drawerEl.classList.add(''demo-drawer--custom'');
  }
';
					yourself));
				with: [
					self renderFormField: 'theme-radio-default' -> 'Default' checked: true on: html.
					self renderFormField: 'theme-radio-custom' -> 'Custom Theme' checked: false on: html.
					self renderFormField: 'theme-radio-accessible' -> 'Accessible Theme' checked: false on: html].
			html button
				class: 'mdc-button';
				class: 'mdc-button--stroked';
				class: 'mdc-button--dense';
				class: 'demo-toolbar-example-heading__rtl-toggle-button';
				onClick: (JSScript new add: (JSStream new
					nextPutAll: 'document.body.setAttribute(''dir'', document.body.getAttribute(''dir'') === ''rtl'' ? ''ltr'' : ''rtl'');';
					yourself));
				with: 'Toggle RTL']