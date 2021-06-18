Class {
	#name : #MCWDescribedColumn,
	#superclass : #MADescribedColumn,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWDescribedColumn >> renderCell: anObject index: anInteger on: html [

	html tableData mdcDataTable__cell; scope: 'row'; with: [
		self renderer valueWithEnoughArguments: (Array with: anObject with: html with: anInteger) ] 
]
