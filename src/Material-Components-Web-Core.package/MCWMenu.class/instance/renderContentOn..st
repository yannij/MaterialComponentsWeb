rendering
renderContentOn: html

	html div
		mdcMenuAnchor;
		script: '';
		with: [
			html div
				mdcMenu;
				id: 'demo-menu';
				style: 'transform-origin: right top 0px; right: 0px; top: 0px';
				tabIndex: '-1';
				mdcAutoInit: 'MDCMenu';
				with: [
					html unorderedList
						class: 'mdc-menu__items mdc-list';
						mdcRole: 'menu';
						attributeAt: 'aria-hidden' put: 'true';
						style: 'transform: scale(1, 1)';
						with: [
							{'Back'->'0.069s'. 'Forward'->'0.124s'. 'Reload'->'0.179s'. ''->''. 'Save As...'->'0.236s'}
							do: [ :each |
								each key isEmpty
									ifTrue: [html listItem mdcListDivider; mdcRole: 'separator']
									ifFalse: [html listItem mdcListItem; mdcRole: 'menuitem'; tabIndex: 0; style: 'transition-delay: ', each value; with: each key]
								]]]]