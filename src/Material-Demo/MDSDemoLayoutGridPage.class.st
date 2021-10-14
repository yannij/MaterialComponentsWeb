Class {
	#name : #MDSDemoLayoutGridPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoLayoutGridPage >> pageInfo [

	^ #(
	'Layout Grid'
	'Material design’s responsive UI is based on a 12-column grid layout.'
	''
	'https://material.io/components/web/catalog/image-lists/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-layout-grid'
	)
]

{ #category : #rendering }
MDSDemoLayoutGridPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoLayoutGridPage >> renderHeroOn: html [

	html html: '<div class="mdc-layout-grid demo-grid"><div class="mdc-layout-grid__inner"><div class="mdc-layout-grid__cell demo-cell"></div><div class="mdc-layout-grid__cell demo-cell"></div><div class="mdc-layout-grid__cell demo-cell"></div></div></div>'
]
