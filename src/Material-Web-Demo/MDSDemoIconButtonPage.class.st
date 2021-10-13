Class {
	#name : #MDSDemoIconButtonPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoIconButtonPage >> pageInfo [

	^ #(
	'Icon Button'
	'Icons are appropriate for buttons that allow a user to take actions or make a selection, such as adding or removing a star to an item.'
	'https://material.io/design/components/buttons.html#toggle-button'
	'https://material.io/components/web/catalog/buttons/icon-buttons/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-icon-button'
	)
]

{ #category : #rendering }
MDSDemoIconButtonPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoIconButtonPage >> renderHeroOn: html [

	html html: '<div><button class="mdc-icon-button mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" aria-pressed="false" aria-label="Add to favorites" style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;"><i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i><i class="material-icons mdc-icon-button__icon">favorite_border</i></button></div>'
]
