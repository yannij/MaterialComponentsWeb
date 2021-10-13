Class {
	#name : #MDSDemoRipplePage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoRipplePage >> pageInfo [

	^ #(
	'Ripple'
	'Ripples are visual representations used to communicate the status of a component or interactive element.'
	'https://material.io/go/design-states'
	'https://material.io/components/web/catalog/ripples/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-ripple'
	)
]

{ #category : #rendering }
MDSDemoRipplePage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoRipplePage >> renderHeroOn: html [

	html html: '<div class="ripple-demo-box mdc-ripple-surface mdc-ripple-upgraded" style="--mdc-ripple-fg-size:139px; --mdc-ripple-fg-scale:1.99225; --mdc-ripple-fg-translate-start:63.9614px, -12.1646px; --mdc-ripple-fg-translate-end:46.5px, -3.5px;">Click here!</div>'
]
