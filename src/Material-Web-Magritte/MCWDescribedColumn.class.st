Class {
	#name : #MCWDescribedColumn,
	#superclass : #MADescribedColumn,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWDescribedColumn >> renderCell: anObject index: anInteger on: html [

	html tableData mdcDataTable__cell; scope: 'row'; with: [
		self magritteDescription mcwNavMethodName
			ifNil: [ self renderer valueWithEnoughArguments: (Array with: anObject with: html with: anInteger) ]
			ifNotNil: [ :method |
				html div mdcChip; mdcRippleUpgraded; with: [
					html anchor mdcChip__text;
						callback: [ self report mcwApplicationGet perform: method with: anObject ];
						with: [ self renderer valueWithEnoughArguments: (Array with: anObject with: html with: anInteger) ] ]  ] ]
]
