Class {
	#name : #MDSDemoFABPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoFABPage >> pageInfo [

	^ #(
	'Floating Action Button'
	'Floating action buttons represents the primary action in an application. Only one floating action button is recommended per screen to represent the most common action.'
	'https://material.io/go/design-fab'
	'https://material.io/components/web/catalog/buttons/floating-action-buttons/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-fab'
	)
]

{ #category : #rendering }
MDSDemoFABPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoFABPage >> renderHeroOn: html [

	html html: '<button class="mdc-fab mdc-ripple-upgraded" aria-label="Favorite"><div class="mdc-fab__ripple"></div><i class="mdc-fab__icon material-icons">favorite_border</i></button>'
]
