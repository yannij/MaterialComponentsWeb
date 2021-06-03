Class {
	#name : #MCWReport,
	#superclass : #MAReport,
	#category : #'Material-Web-Magritte'
}

{ #category : #columns }
MCWReport >> addColumnDescription: aDescription [

	^ self addColumn: (aDescription mcwReportColumnClass new
		magritteDescription: aDescription;
		yourself)
]

{ #category : #'rendering-table' }
MCWReport >> dropdownIconHtml [

	^ '
<span class="mdc-select__dropdown-icon">
	<svg class="mdc-select__dropdown-icon-graphic" viewBox="7 10 10 5">
		<polygon class="mdc-select__dropdown-icon-inactive"
			stroke="none"
			fill-rule="evenodd"
			points="7 10 12 15 17 10">
		</polygon>
		<polygon class="mdc-select__dropdown-icon-active"
			stroke="none"
			fill-rule="evenodd"
			points="7 15 12 10 17 15">
		</polygon>
	</svg>
</span>'
]

{ #category : #'rendering-table' }
MCWReport >> mutationObserverScript: anHtmlId [
"
callback = function(mutationsList, observer) {
	for(const mutation of mutationsList) {
		if (mutation.type === 'attributes') { document.getElementById('id13').onchange(); }
	}
};
new MutationObserver(callback).observe(document.getElementById('id13'), { attributes: true })
"
	| idString |
	"Not being used for now, because it causes a change/reload infinite cycle"
	idString := anHtmlId printString.
	^ 'new MutationObserver(callback = function(mutationsList, observer){for(const mutation of mutationsList){if (mutation.type === ''attributes''){ document.getElementById(', idString, ').onchange();}}}).observe(document.getElementById(', idString, '),{attributes: true})'
]

{ #category : #'rendering-batch' }
MCWReport >> renderBatchFirstOn: html [
	| button |

	button := html button.

	self isOnFirstPage
		ifTrue: [ button disabled ]
		ifFalse: [
			button
				onClick: ((html jQuery ajax)
					callback: [ self batchPage: self defaultBatchPage ];
					onComplete: html javascript refresh) ].

	button
		mdcIconButton;
		mdcMaterialIcons;
		mdcDataTable__paginationButton;
		attributeAt: 'data-first-page' put: 'true';
		with: [
			html div mdcButton__icon; with: 'first_page' ]
]

{ #category : #'rendering-batch' }
MCWReport >> renderBatchItemsOn: html [
	| size itemsStart itemsEnd |

	size := self cache size.
	itemsEnd := self batchPage * self batchSize min: size.
	itemsStart := (self batchPage - 1) * self batchSize + 1.
			
	html div mdcDataTable__paginationTotal;
		with: itemsStart printString, '-', itemsEnd printString, ' of ', size printString.
]

{ #category : #'rendering-batch' }
MCWReport >> renderBatchLastOn: html [
	| button |

	button := html button.

	self isOnLastPage
		ifTrue: [ button disabled ]
		ifFalse: [
			button
				onClick: ((html jQuery ajax)
					callback: [ self batchPage: self batchMaxPages ];
					onComplete: html javascript refresh) ].

	button
		mdcIconButton;
		mdcMaterialIcons;
		mdcDataTable__paginationButton;
		attributeAt: 'data-last-page' put: 'true';
		with: [
			html div mdcButton__icon; with: 'last_page' ]
]

{ #category : #'rendering-batch' }
MCWReport >> renderBatchNextOn: html [
	| button |

	button := html button.

	self isOnLastPage
		ifTrue: [ button disabled ]
		ifFalse: [
			button
				onClick: ((html jQuery ajax)
					callback: [ self nextPage ];
					onComplete: html javascript refresh) ].

	button
		mdcIconButton;
		mdcMaterialIcons;
		mdcDataTable__paginationButton;
		attributeAt: 'data-next-page' put: 'true';
		with: [
			html div mdcButton__icon; with: 'chevron_right' ]
]

{ #category : #'rendering-batch' }
MCWReport >> renderBatchPreviousOn: html [
	| button |

	button := html button.

	self isOnFirstPage
		ifTrue: [ button disabled ]
		ifFalse: [
			button
				onClick: ((html jQuery ajax)
					callback: [ self previousPage ];
					onComplete: html javascript refresh) ].

	button
		mdcIconButton;
		mdcMaterialIcons;
		mdcDataTable__paginationButton;
		attributeAt: 'data-prev-page' put: 'true';
		with: [
			html div mdcButton__icon; with: 'chevron_left' ]
]

{ #category : #rendering }
MCWReport >> renderContentOn: html [

	html div mdcDataTable with: [
		html div mdcDataTable__tableContainer; with: [
			html table mdcDataTable__table with: [
				self renderTableOn: html ] ].

		"(self showBatch and: [ self hasMoreThanOnePage ]) ifTrue: ["
			self showBatch ifTrue: [
				self renderTableBatchOn: html ] ] "]"
]

{ #category : #'rendering-table' }
MCWReport >> renderRowsPerPageOn: html [

	html div mdcDataTable__paginationRowsPerPage; with: [
		html div mdcDataTable__paginationRowsPerPageLabel with: 'Rows per page'.
		html form: [
			self renderRowsPerPageSelectOn: html.
			html submitButton "with: 'Rows per page'" ] ]
]

{ #category : #'rendering-table' }
MCWReport >> renderRowsPerPageSelectOn: html [
	| inputId |

	inputId := html nextId.
	html div mdcSelect; mdcSelect_outlined; mdcSelect_noLabel; mdcDataTable__paginationRowsPerPageSelect; mdcAutoInit: 'MDCSelect'; with: [
		"This hidden input is updated by MDC"
		html hiddenInput callback: [ :value | self batchSize: (value asInteger ifNil: [ self defaultBatchSize ] ifNotNil: [ :size | size ]) ].
		"html hiddenInput
			id: inputId;
			onChange: ((html jQuery ajax)
				callback: [ :value | self batchSize: value asInteger ] value: html jQuery this value;
				onComplete: html javascript refresh)."
		html div mdcSelect__anchor; mdcRole: 'button'; with: [
			html span mdcSelect__selectedTextContainer; with: [
				html span id: html nextId; mdcSelect__selectedText ].
			html html: self dropdownIconHtml ].
			html span mdcNotchedOutline; mdcNotchedOutline_notched; with: [
					html span mdcNotchedOutline__leading.
				html span mdcNotchedOutline__trailing ].
		html div mdcSelect__menu; mdcMenu; mdcMenuSurface; mdcMenuSurface_fullwidth; mdcRole: 'listbox'; with: [
			html unorderedList mdcList; with: [
				"#(10 25 100)" #(2 5 10 25) do: [ :each |
					| listItem |
					listItem := html listItem.
					self batchSize = each ifTrue: [
						listItem mdcListItem_selected ].
					listItem mdcListItem; mdcRole: 'option'; attributeAt: 'data-value' put: each; with: [
						html span mdcListItem__text; with: each ] ] ] ] ].
	"html script: (self mutationObserverScript: inputId)"
]

{ #category : #'rendering-table' }
MCWReport >> renderTableBatchOn: html [

	"self hasMoreThanOnePage ifTrue: ["
		html div mdcDataTable__pagination with: [
			html div mdcDataTable__paginationTrailing; with: [
				self renderRowsPerPageOn: html.
				html div mdcDataTable__paginationNavigation; with: [
					self renderBatchItemsOn: html.
					self renderBatchFirstOn: html.
					self renderBatchPreviousOn: html.
					self renderBatchNextOn: html.
					self renderBatchLastOn: html ] ] ] "]"
]

{ #category : #'rendering-table' }
MCWReport >> renderTableBodyOn: html [ 

	self visible isEmpty 
		ifTrue: [ 
			html tableRow mdcDataTable__row; with: [ 
				html tableData
					mdcDataTable__cell;
					colSpan: self visibleColumns size;
					with: self tableEmpty ] ]
		ifFalse: [
			self visible keysAndValuesDo: [ :index :row |
				html tableRow mdcDataTable__row; with: [
					self visibleColumns do: [ :col | 
						col renderCell: row index: index on: html  ] ] ] ]
]

{ #category : #'rendering-table' }
MCWReport >> renderTableHeadOn: html [

	html tableRow "mdcDataTable__headerRow" class: 'mdc-data-table__header-row'; with: [
		self visibleColumns do: [ :each |
			html tableHeading mdcDataTable__headerCell; mdcRole: 'columnHeader'; scope: 'col'; with: each label ] ]
]

{ #category : #rendering }
MCWReport >> renderTableOn: html [

	"self showCaption
		ifTrue: [ self renderTableCaptionOn: html ]."
	"self showSummary
		ifTrue: [ self renderTableSummaryOn: html ]."
	html tableHead: [
		self showHeader
			ifTrue: [ self renderTableHeadOn: html ].
		"self showFilter
			ifTrue: [ self renderTableFilterOn: html ]" ].

	html tableBody mdcDataTable__content; with: [
		self showBody
			ifTrue: [ self renderTableBodyOn: html ] ]
]

{ #category : #'accessing-readonly' }
MCWReport >> states [
	^ Array new
]
