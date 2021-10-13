Class {
	#name : #MDSDemoDataTablePage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoDataTablePage >> pageInfo [

	^ #(
	'Data Table'
	'Data tables display information in a way that’s easy to scan, so that users can look for patterns and insights.'
	'https://material.io/go/design-data-tables'
	'https://material.io/components/web/catalog/data-tables/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-data-table'
	)
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

	html html: '<div class="mdc-data-table"><table class="mdc-data-table__table"><thead><tr class="mdc-data-table__header-row"><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Dessert</th><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Calories</th><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Fat</th><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Carbs</th><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Protein (g)</th></tr></thead><tbody class="mdc-data-table__content"><tr data-row-id="u54" class="mdc-data-table__row" aria-selected="false"><td class="mdc-data-table__cell" id="u54">Frozen yogurt</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">159</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">6</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">24</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">4</td></tr><tr data-row-id="u55" class="mdc-data-table__row" aria-selected="false"><td class="mdc-data-table__cell" id="u55">Ice cream sandwich</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">237</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">9</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">37</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">4.3</td></tr><tr data-row-id="u56" class="mdc-data-table__row" aria-selected="false"><td class="mdc-data-table__cell" id="u56">Eclair</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">262</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">16</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">24</td><td class="mdc-data-table__cell mdc-data-table__cell--numeric">6</td></tr></tbody></table></div>'
]
