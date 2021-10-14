Class {
	#name : #MDSDemoLinearProgressPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoLinearProgressPage >> pageInfo [

	^ #(
	'Linear Progress Indicator'
	'Progress indicators display the length of a process or express an unspecified wait time.'
	'https://material.io/go/design-progress-indicators'
	'https://material.io/components/web/catalog/linear-progress/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-linear-progress'
	)
]

{ #category : #rendering }
MDSDemoLinearProgressPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoLinearProgressPage >> renderHeroOn: html [

	html html: '<div class="hero-linear-progress-indicator"><div role="progressbar" class="mdc-linear-progress"><div class="mdc-linear-progress__buffering-dots"></div><div class="mdc-linear-progress__buffer"></div><div class="mdc-linear-progress__bar mdc-linear-progress__primary-bar" style="transform: scaleX(0.5);"><span class="mdc-linear-progress__bar-inner"></span></div><div class="mdc-linear-progress__bar mdc-linear-progress__secondary-bar"><span class="mdc-linear-progress__bar-inner"></span></div></div></div>'
]
