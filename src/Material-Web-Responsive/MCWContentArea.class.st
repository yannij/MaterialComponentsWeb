Class {
	#name : #MCWContentArea,
	#superclass : #MCWUserInterfaceRegion,
	#instVars : [
		'component'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MCWContentArea >> component [
	^ component
]

{ #category : #accessing }
MCWContentArea >> component: anObject [
	component := anObject
]

{ #category : #rendering }
MCWContentArea >> renderCanvasOn: html [

	self component ifNil: [ ^ self ].

	"html div mdcLayoutGrid;
		with: [
			html div mdcLayoutGrid__inner; with: [
				self mcwApplicationGet logString: 'cellSpan: ', self layout cellSpan printString.
				html div mdcLayoutGrid__cell_span: self layout cellSpan; with: self component ] ]"

	html render: self component
]

{ #category : #rendering }
MCWContentArea >> renderContentOn: html [ 

	self renderCanvasOn: html

]
