rendering - landing page
renderCatalogListItem: anItem on: html

	html listItem
		class: 'catalog-image-list-item';
		mdcImageList__item;
		with: [
			html anchor
				class: 'catalog-image-link';
				callback: [self pageName: anItem first asSymbol];
				with: [
					html div
						class: 'catalog-image-list-item-container';
						mdcImageList__imageAspectContainer; mdcRippleSurface; mdcRippleUpgraded;
						with: [
							html div mdcImageList__image; with: [
								html image
									width: '100%';
									height: '100%';
									url: 'https://material-components.github.io/material-components-web-catalog/static/media/', anItem third]].
					html div
						mdcImageList__supporting;
						with: [html span class: 'catalog-image-list-label'; mdcImageList__label; with: anItem second]]]