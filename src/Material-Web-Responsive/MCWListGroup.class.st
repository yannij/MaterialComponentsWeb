Class {
	#name : #MCWListGroup,
	#superclass : #MCWLayoutComponent,
	#instVars : [
		'groupedLists'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MCWListGroup >> addGroupedList: aList [

	self groupedLists add: aList

]

{ #category : #accessing }
MCWListGroup >> groupedLists [
	^ groupedLists
]

{ #category : #accessing }
MCWListGroup >> groupedLists: anObject [
	groupedLists := anObject
]

{ #category : #initialization }
MCWListGroup >> initialize [

	super initialize.

	self groupedLists: OrderedCollection new.

]

{ #category : #rendering }
MCWListGroup >> renderContentOn: html [

	html div mdcDeprecatedListGroup; with: [
		self groupedLists do: [ :eachList | html render: eachList ] ]

]
