rendering - landing page
renderCatalogListOn: html

	html unorderedList
		id: 'catalog-image-list';
		mdcImageList;
		class: 'standard-image-list';
		with: [
			self catalogList do: [:each |
				self renderCatalogListItem: each on: html]]