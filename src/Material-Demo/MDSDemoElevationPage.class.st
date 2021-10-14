Class {
	#name : #MDSDemoElevationPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoElevationPage >> pageInfo [

	^ #(
	'Elevation'
	'Elevation is the relative depth, or distance, between two surfaces along the z-axis.'
	'https://material.io/go/design-elevation'
	'https://material.io/components/web/catalog/elevation/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-elevation'
	)
]

{ #category : #rendering }
MDSDemoElevationPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoElevationPage >> renderHeroOn: html [

	html html: '<div class="elevation-hero"><div class="elevation-demo-surface mdc-elevation--z0">Flat 0dp</div><div class="elevation-demo-surface mdc-elevation--z8">Raised 8dp</div><div class="elevation-demo-surface mdc-elevation--z16">Raised 16dp</div></div>'
]
