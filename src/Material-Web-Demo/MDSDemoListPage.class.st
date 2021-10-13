Class {
	#name : #MDSDemoListPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoListPage >> pageInfo [

	^ #(
	'List'
	'Lists present multiple line items vertically as a single continuous element.'
	'https://material.io/go/design-lists'
	'https://material.io/components/web/catalog/lists/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-list'
	)
]

{ #category : #rendering }
MDSDemoListPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoListPage >> renderHeroOn: html [

	html html: '<div class="hero-list"><ul class="mdc-list demo-list"><li class="mdc-list-item mdc-ripple-upgraded" id="054dcc17-bb6c-4d40-a6e1-3563be8cfc85" tabindex="-1">Line item</li><li class="mdc-list-item mdc-ripple-upgraded" id="87c7377a-1e4a-4524-889e-d9a9735c28de" tabindex="-1">Line item</li><li class="mdc-list-item mdc-ripple-upgraded" id="29d04186-b76a-451d-bde2-3689d65a6df8" tabindex="-1">Line item</li></ul></div>'
]
