Class {
	#name : #MDSDemoMenuPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoMenuPage >> pageInfo [

	^ #(
	'Menu'
	'Menus display a list of choices on a transient sheet of material.'
	'https://material.io/go/design-menus'
	'https://material.io/components/web/catalog/menus/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-menu'
	)
]

{ #category : #rendering }
MDSDemoMenuPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoMenuPage >> renderHeroOn: html [

	html html: '<div class="mdc-menu mdc-menu-surface mdc-menu-surface--open hero-menu" tabindex="-1"><ul class="mdc-list" role="menu" aria-hidden="true"><li class="mdc-list-item mdc-ripple-upgraded" role="menuitem" tabindex="-1">A Menu Item</li><li class="mdc-list-item mdc-ripple-upgraded" role="menuitem" tabindex="-1">Another Menu Item</li></ul></div>'
]
