rendering - landing page
renderCatalogListItem: anItem on: html

	html listItem
		class: 'catalog-image-list-item mdc-image-list__item';
		with: [
			html anchor
				class: 'catalog-image-link';
				"url: '#/component/', anItem first;"
				callback: [self pageName: anItem first asSymbol];
				with: [
					html div
						class: 'catalog-image-list-item-container mdc-image-list__image-aspect-container mdc-ripple-surface mdc-ripple-upgraded';
						with: [
							html div class: 'mdc-image-list__image';
								with: [
									"self renderSvgOn: html"
									html image
										width: '100%';
										height: '100%';
										url: 'https://material-components.github.io/material-components-web-catalog/static/media/', anItem third
									]].
					html div
						class: 'mdc-image-list__supporting';
						with: [html span class: 'catalog-image-list-label mdc-image-list__label'; with: anItem second]]]