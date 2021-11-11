Class {
	#name : #MDSDemoImageListPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoImageListPage >> pageInfo [

	^ #(
	'Image List'
	'Image lists display a collection of images in an organized grid.'
	'https://material.io/go/design-image-list'
	'https://material.io/components/web/catalog/image-lists/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-image-list'
	)
]

{ #category : #rendering }
MDSDemoImageListPage >> renderDemoMasonryOn: html [
	| urlPart data |

	html heading level3; mdcTypography_subtitle1; with: 'Masonry Image List'.

	urlPart := 'https://material-components.github.io/material-components-web-catalog/static/media/photos/'.
	data := #(
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
).

	html unorderedList mdcImageList; mdcImageList_masonry;
		style:
'-webkit-column-count: 5;
column-count: 5;
-webkit-column-gap: 16px;
column-gap: 16px;
max-width: 900px;';
		with: [
			data do: [ :image |
				html listItem mdcImageList__item; style: 'margin-bottom: 16px'; with: [
					html image mdcImageList__image; url: urlPart, image; altText: 'Text label'.
					html div mdcImageList__supporting; with: [
						html span mdcImageList__label; with: 'Text label' ] ] ] ]
]

{ #category : #rendering }
MDSDemoImageListPage >> renderDemoStandardOn: html [
	| urlPart |

	html heading level3; mdcTypography_subtitle1; with: 'Standard Image List with Text Protection'.

	urlPart := 'https://material-components.github.io/material-components-web-catalog/static/media/photos/'.
	html unorderedList mdcImageList; mdcImageList_withTextProtection;
		style: 'max-width: 900px';
		with: [
			1 to: 15 do: [ :i |
				html listItem mdcImageList__item; style: 'width: calc(100% / 5 - 4.2px); margin: 2px'; with: [
					html div mdcImageList__imageAspectContainer; style: 'padding-bottom: 66.66667%'; with: [
						html image mdcImageList__image; style: 'border-radius: 8px'; url: urlPart, '3x2/', i printString, '.jpg'; altText: 'Text label' ].
					html div mdcImageList__supporting; style: 'border-radius: 0 0 8px 8px'; with: [
						html span mdcImageList__label; with: 'Text label' ] ] ] ]
]

{ #category : #rendering }
MDSDemoImageListPage >> renderDemosOn: html [

	self renderDemoStandardOn: html.
	self renderDemoMasonryOn: html
]

{ #category : #rendering }
MDSDemoImageListPage >> renderHeroOn: html [

	html unorderedList mdcImageList;
		style: 'width: 300px';
		with: [
			1 to: 15 do: [ :i |
				html listItem mdcImageList__item; style: 'width: calc(100% / 5 - 4.2px); margin: 2px'; with: [
					html div mdcImageList__imageAspectContainer; with: [
						html image mdcImageList__image; style: 'background-color: #000' ] ] ] ]
]
