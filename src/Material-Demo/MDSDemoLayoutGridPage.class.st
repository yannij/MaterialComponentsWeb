Class {
	#name : #MDSDemoLayoutGridPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoLayoutGridPage >> pageInfo [

	^ #(
	'Layout Grid'
	'Material design’s responsive UI is based on a 12-column grid layout.'
	''
	'https://material.io/components/web/catalog/image-lists/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-layout-grid'
	)
]

{ #category : #rendering }
MDSDemoLayoutGridPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoLayoutGridPage >> renderHeroOn: html [

	html div mdcLayoutGrid; style: 'background: rgba(0,0,0,.2);min-width: 360px'; with: [
		html div mdcLayoutGrid__inner; with: [
			1 to: 3 do: [ :i |
				html div mdcLayoutGrid__cell; style: 'background: rgba(0,0,0,.2);height: 100px' ] ] ]
]
