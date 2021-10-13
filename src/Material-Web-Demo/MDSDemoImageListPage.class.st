Class {
	#name : #MDSDemoImageListPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
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
MDSDemoImageListPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoImageListPage >> renderHeroOn: html [

	html html: '<div><ul class="mdc-image-list hero-image-list"><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li><li class="mdc-image-list__item"><div class="mdc-image-list__image-aspect-container"><div class="mdc-image-list__image"></div></div></li></ul></div>'
]
