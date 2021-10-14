Class {
	#name : #MDSDemoDrawerPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoDrawerPage >> pageInfo [

	^ #(
	'Drawer'
	'The navigation drawer slides in from the left and contains the navigation destinations for your app.'
	'https://material.io/go/design-navigation-drawer'
	'https://material.io/components/web/catalog/drawers/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-drawer'
	)
]

{ #category : #rendering }
MDSDemoDrawerPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoDrawerPage >> renderHeroOn: html [

	html html: '<div class="hero-drawer"><aside id="demo-drawer" class="mdc-drawer demo-drawer"><div class="mdc-drawer__header"><h3 class="mdc-drawer__title">Title</h3><h6 class="mdc-drawer__subtitle">subtext</h6></div><div class="mdc-drawer__content"><nav class="mdc-list"><a class="mdc-list-item mdc-list-item--activated" href="#" tabindex="-1" aria-selected="true"><i class="material-icons mdc-list-item__graphic" aria-hidden="true">inbox</i>Inbox</a><a class="mdc-list-item" href="#" tabindex="-1"><i class="material-icons mdc-list-item__graphic" aria-hidden="true">star</i>Star</a><a class="mdc-list-item" href="#" tabindex="-1"><i class="material-icons mdc-list-item__graphic" aria-hidden="true">send</i>Sent Mail</a><a class="mdc-list-item" href="#" tabindex="-1"><i class="material-icons mdc-list-item__graphic" aria-hidden="true">drafts</i>Drafts</a></nav></div></aside></div>'
]
