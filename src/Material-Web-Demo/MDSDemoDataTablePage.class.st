Class {
	#name : #MDSDemoDataTablePage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoDataTablePage >> renderContentOn: html [

	self renderPageOn: html
]

{ #category : #rendering }
MDSDemoDataTablePage >> renderDemosOn: html [
	| dataHeadings dataRows |

	dataHeadings := { 'Dessert'->false. 'Carbs'->true. 'Protein (g)'->true. 'Comments'->false. }.
	dataRows := {
		{ 'Frozen yogurt'. '24'.'4.0'.'Super tasty' }.
		{ 'Ice cream sandwich'. '37'.'4.33333333333'.'I like ice cream more' }.
		{ 'Eclair'. '24'.'6.0'.'New filing flavor' }.
	 }.

	html break; break; break.
	html div mdcDataTable with: [
		html div mdcDataTable__tableContainer; with: [ 
			html table mdcDataTable__table; ariaLabel: 'Dessert calories'; with: [
				html tableHead with: [
					html tableRow "mdcDataTable__headerRow" with: [
						dataHeadings do: [ :each | | tag |
							tag := html tableHeading mdcDataTable__headerCell; mdcRole: 'columnHeader'; scope: 'col'; with: each key.
							each value ifTrue: [ tag  mdcDataTable__headerCell_numeric ] ] ]
					].
				html tableBody mdcDataTable__content; with: [
					dataRows do: [ :eachRow |
						html tableRow mdcDataTable__row; with: [
							eachRow keysAndValuesDo: [ :index :each | | tag |
								tag := html tableData mdcDataTable__cell; scope: 'row'; with: each.
								(dataHeadings at: index) value ifTrue: [ tag  mdcDataTable__headerCell_numeric ] ] ] ] ] ] ] ]
]

{ #category : #rendering }
MDSDemoDataTablePage >> renderHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]
]

{ #category : #rendering }
MDSDemoDataTablePage >> renderPageOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-data-tables'
		'https://material.io/components/web/catalog/data-tables/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-data-table'
	).
	headlineString := 'Data Table'.
	summaryString := 'Data tables display information in a way that’s easy to scan, so that users can look for patterns and insights.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderHeroOn: html.
	self renderResources: resources on: html.
	self renderDemos: [ :value | self renderDemosOn: value ] on: html
]
