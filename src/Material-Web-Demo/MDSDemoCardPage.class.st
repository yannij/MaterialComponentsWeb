Class {
	#name : #MDSDemoCardPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoCardPage >> renderHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]
]

{ #category : #rendering }
MDSDemoCardPage >> renderPageOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-cards'
		'https://material.io/components/web/catalog/cards/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-card'
	).
	headlineString := 'Card'.
	summaryString := 'Cards contain content and actions about a single subject.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderHeroOn: html.
	self renderResources: resources on: html.
	"self renderDemos: [ :value | self renderDemosOn: value ] on: html"
]
