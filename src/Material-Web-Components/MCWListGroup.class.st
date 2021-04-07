Class {
	#name : #MCWListGroup,
	#superclass : #MCWWebComponent,
	#instVars : [
		'groupedLists'
	],
	#category : 'Material-Web-Components'
}

{ #category : #accessing }
MCWListGroup >> addGroupedList: aList [

	self groupedLists add: aList

]

{ #category : #accessing }
MCWListGroup >> addListItem: aListItem [

	self listItems add: aListItem

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

	html div mdcListGroup; with: [
		self groupedLists do: [:eachList | html render: eachList]]

]
