rendering
renderContentOn: html

	html div
		class: 'mdc-menu-anchor';
		script: '';
		with: [
			html div
				class: 'mdc-menu';
				id: 'demo-menu';
				style: 'transform-origin: right top 0px; right: 0px; top: 0px';
				tabIndex: '-1';
				attributeAt: 'data-mdc-auto-init' put: 'MDCMenu';
				with: [
			html html: '
              <ul class="mdc-menu__items mdc-list" role="menu" aria-hidden="true" style="transform: scale(1, 1);">
                <li class="mdc-list-item" role="menuitem" tabindex="0" style="transition-delay: 0.069s;">Back</li>
                <li class="mdc-list-item" role="menuitem" tabindex="0" style="transition-delay: 0.124s;">Forward</li>
                <li class="mdc-list-item" role="menuitem" tabindex="0" style="transition-delay: 0.179s;">Reload</li>
                <li class="mdc-list-divider" role="separator"></li>
                <li class="mdc-list-item" role="menuitem" tabindex="0" style="transition-delay: 0.236s;">Save As...</li>
              </ul>
']]