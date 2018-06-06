rendering
renderProductsOn: html

	html div class: 'shrine-body'; mdcElevation__z4; with: [
		html unorderedList
			mdcImageList;
			mdcImageList__masonry;
			class: 'product-list';
			with: [
				self products do: [:each |
					html listItem mdcImageList__item; with: [
						html image mdcImageList__image; url: 'http://localhost:8081/', each first.
						html div mdcImageList__supporting; with: [
							html span mdcImageList__label; mdcTypography__subtitle2; with: each second]]]]]