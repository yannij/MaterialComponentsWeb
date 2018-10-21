rendering
renderProductsOn: html

	html div class: 'shrine-body'; mdcElevation_z4; with: [
		html unorderedList
			mdcImageList;
			mdcImageList_masonry;
			class: 'product-list';
			with: [
				self products do: [:each |
					html listItem mdcImageList__item; with: [
						html image mdcImageList__image; url: 'https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/', each first.
						html div mdcImageList__supporting; with: [
							html span mdcImageList__label; mdcTypography_subtitle2; with: each second]]]]]