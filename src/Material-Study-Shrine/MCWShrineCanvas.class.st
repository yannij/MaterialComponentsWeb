Class {
	#name : #MCWShrineCanvas,
	#superclass : #MCWWebComponent,
	#category : 'Material-Study-Shrine'
}

{ #category : #rendering }
MCWShrineCanvas >> products [

	^#(
('assets/ginger-scarf.jpg' 'Ginger scarf')
('assets/blue-stone-mug.jpg' 'Blue stone mug')
('assets/cerise-scallop.jpg' 'Cerise scallop tee')
('assets/chambray-napkins.jpg' 'Chambray napkins')
('assets/fine-lines.jpg' 'Fine lines tee')
('assets/garden-strand.jpg' 'Garden strand')
('assets/gatsby-hat.jpg' 'Gatsby hat')
('assets/gilt-desk-trio.jpg' 'Gilt desk trio')
('assets/kitchen-quattro.jpg' 'Kitchen quattro')
('assets/seabreeze-sweater.jpg' 'Seabreeze sweater')
('assets/shrug-bag.jpg' 'Shrug bag')
('assets/stella-sunglasses.jpg' 'Stella sunglasses')
('assets/surf-and-perf.jpg' 'Surf and perf shirt')
('assets/vagabond-sack.jpg' 'Vagabond sack')
('assets/walter-henley.jpg' 'Walter henley (white)')
('assets/weave-keyring.jpg' 'Weave keyring')
	)
]

{ #category : #rendering }
MCWShrineCanvas >> renderContentOn: html [

	self renderProductsOn: html

]

{ #category : #rendering }
MCWShrineCanvas >> renderProductsOn: html [

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
]
