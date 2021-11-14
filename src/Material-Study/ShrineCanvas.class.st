Class {
	#name : #ShrineCanvas,
	#superclass : #MDSComponent,
	#instVars : [
		'products'
	],
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

{ #category : #accessing }
ShrineCanvas >> products [

	products ifNil: [
		products := self productsBuild ].

	^ products
]

{ #category : #accessing }
ShrineCanvas >> products: anObject [

	products := anObject
]

{ #category : #rendering }
ShrineCanvas >> productsBuild [

	^ (WAJsonParser parse: self productsJson) collect: [ :each |
		| number |
		number := 10000 atRandom.
		each at: 'price' put: number / 100.0.
		each at: 'priceAmount' put: number.
		each at: 'priceCurrency' put: 'cad'.
		each ]
]

{ #category : #rendering }
ShrineCanvas >> productsFiltered [
	| categoryValue |

	categoryValue := self mcwApplicationGet currentTab.

	^ self products select: [ :eachProduct |
		(eachProduct at: 'tags') includes: categoryValue ]
]

{ #category : #rendering }
ShrineCanvas >> productsJson [

	^ '[
{"id": "prod_1", "tags":["Accessories"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/ginger-scarf.jpg", "description": "Ginger scarf"},
{"id": "prod_2", "tags":["Apartment", "Featured"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/blue-stone-mug.jpg", "description": "Blue stone mug"},
{"id": "prod_3", "tags":["Tops"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/cerise-scallop.jpg", "description": "Cerise scallop tee"},
{"id": "prod_4", "tags":["Apartment", "Featured"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/chambray-napkins.jpg", "description": "Chambray napkins"},
{"id": "prod_5", "tags":["Tops"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/fine-lines.jpg", "description": "Fine lines tee"},
{"id": "prod_6", "tags":["Accessories", "Featured"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/garden-strand.jpg", "description": "Garden strand"},
{"id": "prod_7", "tags":["Accessories"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/gatsby-hat.jpg", "description": "Gatsby hat"},
{"id": "prod_8", "tags":["Apartment"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/gilt-desk-trio.jpg", "description": "Gilt desk trio"},
{"id": "prod_9", "tags":["Apartment"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/kitchen-quattro.jpg", "description": "Kitchen quattro"},
{"id": "prod_10", "tags":["Tops"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/seabreeze-sweater.jpg", "description": "Seabreeze sweater"},
{"id": "prod_11", "tags":["Accessories"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/shrug-bag.jpg", "description": "Shrug bag"},
{"id": "prod_12", "tags":["Accessories"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/stella-sunglasses.jpg", "description": "Stella sunglasses"},
{"id": "prod_13", "tags":["Tops"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/surf-and-perf.jpg", "description": "Surf and perf shirt"},
{"id": "prod_14", "tags":["Accessories"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/vagabond-sack.jpg", "description": "Vagabond sack"},
{"id": "prod_15", "tags":["Tops"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/walter-henley.jpg", "description": "Walter henley (white)"},
{"id": "prod_16", "tags":["Accessories"],
 "images": "https://raw.githubusercontent.com/material-components/material-components-web-codelabs/master/mdc-101/complete/assets/weave-keyring.jpg", "description": "Weave keyring"}
]'
]

{ #category : #rendering }
ShrineCanvas >> productsOLD [

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
ShrineCanvas >> renderContentOn: html [

	self renderProductsOn: html

]

{ #category : #rendering }
ShrineCanvas >> renderProduct: aProduct on: html [
	| imageUrl productName |

	imageUrl := aProduct at: 'images'.
	productName := aProduct at: 'description'.
	html image mdcImageList__image; url: imageUrl.
	html div mdcImageList__supporting; with: [
		html span mdcImageList__label; mdcTypography_subtitle2; with: productName ]
]

{ #category : #rendering }
ShrineCanvas >> renderProductsOn: html [

	html div class: 'shrine-body'; mdcElevation_z4; with: [
		html unorderedList mdcImageList; mdcImageList_masonry; class: 'product-list'; with: [
			self productsFiltered do: [ :eachProduct |
				html listItem mdcImageList__item; with: [
					html div: [
						html anchor mdcMaterialIcons; mdcIconButton;
							style: 'position: absolute; top: 10; left: 10';
							callback: [ self addToShoppingCart: eachProduct ];
							with: [ html div mdcButton__ripple; with: 'add_shopping_cart' ].
						self renderProduct: eachProduct on: html ] ] ] ] ]
]
