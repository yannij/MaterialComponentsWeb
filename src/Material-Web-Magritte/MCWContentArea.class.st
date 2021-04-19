Class {
	#name : #MCWContentArea,
	#superclass : #MCWUserInterfaceRegion,
	#instVars : [
		'component'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MCWContentArea >> canvasDivId [

	^ 'dsCanvas'
]

{ #category : #accessing }
MCWContentArea >> component [
	^ component
]

{ #category : #accessing }
MCWContentArea >> component: anObject [
	component := anObject
]

{ #category : #rendering }
MCWContentArea >> renderCanvasDivOn: html [

	html div
		id: self canvasDivId;
		with: [ self renderCanvasOn: html ]

]

{ #category : #rendering }
MCWContentArea >> renderCanvasOn: html [

	self component ifNil: [ ^ self ].

	html div mdcLayoutGrid;
		style: '--mdc-layout-grid-margin-desktop: 16px';
		style: '--mdc-layout-grid-gutter-desktop: 16px';
		with: [
			html div mdcLayoutGrid__inner; with: [
				html div mdcLayoutGrid__cell_span: self component layoutCellSpan; with: [
					html render: self component ] ] ]

]

{ #category : #rendering }
MCWContentArea >> renderContentOn: html [ 

	self renderCanvasDivOn: html

]