rendering - image list
renderDemoImageListStandardOn: html

	html unorderedList
		id: 'standard-image-list';
		mdcImageList;
		class: 'standard-image-list';
		with: [
			#(
'3x2/1.jpg'
'3x2/2.jpg'
'3x2/3.jpg'
'3x2/4.jpg'
'3x2/5.jpg'
'3x2/6.jpg'
'3x2/7.jpg'
'3x2/8.jpg'
'3x2/9.jpg'
'3x2/10.jpg'
'3x2/11.jpg'
'3x2/12.jpg'
'3x2/13.jpg'
'3x2/14.jpg'
'3x2/15.jpg'
		) do: [:each |
			html listItem
			mdcImageList__item;
			with: [
				html div mdcImageList__imageAspectContainer;
					with: [html image mdcImageList__image; url: 'https://material-components-web.appspot.com/images/photos/', each].
				self renderDemoImageListPhotoLabelOn: html]]]
