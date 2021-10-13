Class {
	#name : #MDSDemoChipsPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoChipsPage >> pageInfo [

	^ #(
	'Chips'
	'Chips are compact elements that allow users to enter information, select a choice, filter content, or trigger an action.'
	'https://material.io/go/design-chips'
	'https://material.io/components/web/catalog/chips/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-chips'
	)
]

{ #category : #rendering }
MDSDemoChipsPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoChipsPage >> renderHeroOn: html [

	html html: '<div class="mdc-chip-set" role="grid"><div class="mdc-chip mdc-ripple-upgraded" role="row" id="mdc-chip-1"><div class="mdc-chip__ripple"></div><div class="mdc-chip__text">Chip One</div><span role="gridcell"><span role="button" tabindex="0" class="mdc-chip__text">Chip Two</span></span></div><div class="mdc-chip mdc-ripple-upgraded" role="row" id="mdc-chip-2"><div class="mdc-chip__ripple"></div><div class="mdc-chip__text">Chip Two</div><span role="gridcell"><span role="button" tabindex="0" class="mdc-chip__text">Chip Two</span></span></div><div class="mdc-chip mdc-ripple-upgraded" role="row" id="mdc-chip-3"><div class="mdc-chip__ripple"></div><div class="mdc-chip__text">Chip Three</div><span role="gridcell"><span role="button" tabindex="0" class="mdc-chip__text">Chip Two</span></span></div><div class="mdc-chip mdc-ripple-upgraded" role="row" id="mdc-chip-4"><div class="mdc-chip__ripple"></div><div class="mdc-chip__text">Chip Four</div><span role="gridcell"><span role="button" tabindex="0" class="mdc-chip__text">Chip Two</span></span></div></div>'
]
