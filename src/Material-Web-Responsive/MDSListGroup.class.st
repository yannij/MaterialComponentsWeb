Class {
	#name : #MDSListGroup,
	#superclass : #MDSComponent,
	#instVars : [
		'groupedLists'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSListGroup >> addGroupedList: aList [

	self groupedLists add: aList

]

{ #category : #accessing }
MDSListGroup >> groupedLists [
	^ groupedLists
]

{ #category : #accessing }
MDSListGroup >> groupedLists: anObject [
	groupedLists := anObject
]

{ #category : #initialization }
MDSListGroup >> initialize [

	super initialize.

	self groupedLists: OrderedCollection new.

]

{ #category : #rendering }
MDSListGroup >> renderContentOn: html [

	html div mdcDeprecatedListGroup; with: [
		self groupedLists do: [ :eachList | html render: eachList ] ]

]
