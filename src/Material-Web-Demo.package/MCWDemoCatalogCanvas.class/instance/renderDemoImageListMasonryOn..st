rendering - image list
renderDemoImageListMasonryOn: html

	html unorderedList
		id: 'masonry-image-list';
		mdcImageList;
		mdcImageList_masonry;
		class: 'masonry-image-list';
		with: [
		#(
'3x2/16.jpg'
'2x3/1.jpg'
'3x2/1.jpg'
'2x3/2.jpg'
'2x3/3.jpg'
'3x2/2.jpg'
'2x3/4.jpg'
'3x2/3.jpg'
'2x3/5.jpg'
'3x2/4.jpg'
'2x3/6.jpg'
'3x2/5.jpg'
'2x3/7.jpg'
'3x2/6.jpg'
'3x2/7.jpg'
		) do: [:each |
			html listItem
			mdcImageList__item;
			with: [
				html image
					mdcImageList__image;
					url: 'https://material-components-web.appspot.com/images/photos/', each.
				self renderDemoImageListPhotoLabelOn: html]]]
