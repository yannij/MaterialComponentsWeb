Class {
	#name : #MDSDemoSwitchPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoSwitchPage >> pageInfo [

	^ #(
	'Switch'
	'Switches communicate an action a user can take. They are typically placed throughout your UI, in places like dialogs, forms, cards, and toolbars.'
	'https://material.io/go/design-switches'
	'https://material.io/components/web/catalog/input-controls/switches/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-switch'
	)
]

{ #category : #rendering }
MDSDemoSwitchPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoSwitchPage >> renderHeroOn: html [

	html html: '<span><div class="mdc-switch mdc-switch--checked"><div class="mdc-switch__track"></div><div class="mdc-switch__thumb-underlay mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;"><div class="mdc-switch__thumb"><input type="checkbox" id="hero-switch" class="mdc-switch__native-control" role="switch" aria-checked="true" checked=""></div></div></div><label for="hero-switch">off/on</label></span>'
]
