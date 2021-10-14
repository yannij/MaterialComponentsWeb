Class {
	#name : #ShrineCanvas,
	#superclass : #MDSComponent,
	#category : #'Material-Study-Shrine'
}

{ #category : #rendering }
ShrineCanvas >> addToShoppingCart: aProduct [
	| app |
	app := self mcwApplicationGet.
	app stripeInterface
		shoppingCart: app shoppingCart
		addProduct: aProduct
]

{ #category : #rendering }
ShrineCanvas >> products [

	true ifTrue: [ ^ WAJsonParser parse: self productsJson ].

	^ #(
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
ShrineCanvas >> productsJson [

	^ '[
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/ginger-scarf.jpg"], "name": "Ginger scarf"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/blue-stone-mug.jpg"], "name": "Blue stone mug"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/cerise-scallop.jpg"], "name": "Cerise scallop tee"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/chambray-napkins.jpg"], "name": "Chambray napkins"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/fine-lines.jpg"], "name": "Fine lines tee"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/garden-strand.jpg"], "name": "Garden strand"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/gatsby-hat.jpg"], "name": "Gatsby hat"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/gilt-desk-trio.jpg"], "name": "Gilt desk trio"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/kitchen-quattro.jpg"], "name": "Kitchen quattro"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/seabreeze-sweater.jpg"], "name": "Seabreeze sweater"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/shrug-bag.jpg"], "name": "Shrug bag"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/stella-sunglasses.jpg"], "name": "Stella sunglasses"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/surf-and-perf.jpg"], "name": "Surf and perf shirt"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/vagabond-sack.jpg"], "name": "Vagabond sack"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/walter-henley.jpg"], "name": "Walter henley (white)"},
{"id": "prod_1", "description": null, "images": ["https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/weave-keyring.jpg"], "name": "Weave keyring"}
]'
]

{ #category : #rendering }
ShrineCanvas >> renderContentOn: html [

	self renderProductsOn: html

]

{ #category : #rendering }
ShrineCanvas >> renderProduct: aProduct on: html [
	| imageUrl productName |

	imageUrl := (aProduct at: 'images') first.
	productName := aProduct at: 'name'.
	html image mdcImageList__image; url: imageUrl.
	html div mdcImageList__supporting; with: [
		html span mdcImageList__label; mdcTypography_subtitle2; with: productName ]
]

{ #category : #rendering }
ShrineCanvas >> renderProductsOn: html [

	html div class: 'shrine-body'; mdcElevation_z4; with: [
		html unorderedList mdcImageList; mdcImageList_masonry; class: 'product-list'; with: [
			self products do: [ :eachProduct |
				html listItem mdcImageList__item; with: [
					html div: [
						html anchor mdcMaterialIcons; mdcIconButton;
							style: 'position: absolute; top: 10; left: 10';
							callback: [ self addToShoppingCart: eachProduct ];
							with: [ html div mdcButton__ripple; with: 'add_shopping_cart' ].
						self renderProduct: eachProduct on: html ] ] ] ] ]
]
