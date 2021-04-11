Class {
	#name : #MCWSideSheet,
	#superclass : #MCWUserInterfaceRegion,
	#instVars : [
		'component'
	],
	#category : #'Material-Web-Components'
}

{ #category : #accessing }
MCWSideSheet >> canvasDivId [

	^'dsCanvas'
]

{ #category : #accessing }
MCWSideSheet >> component [
	^ component
]

{ #category : #accessing }
MCWSideSheet >> component: anObject [
	component := anObject
]

{ #category : #rendering }
MCWSideSheet >> renderCanvasDivOn: html [

	html div
		id: self canvasDivId;
		with: [self renderCanvasOn: html]

]

{ #category : #rendering }
MCWSideSheet >> renderCanvasOn: html [

	self component isNil
		ifTrue: [^self].

	html div mdcLayoutGrid;
		style: '--mdc-layout-grid-margin-desktop: 16px';
		style: '--mdc-layout-grid-gutter-desktop: 16px';
		with: [
			html div mdcLayoutGrid__inner; with: [
				html div mdcLayoutGrid__cell_span: self component layoutCellSpan; with: [
					html render: self component]]]

]

{ #category : #rendering }
MCWSideSheet >> renderContentOn: html [

	self isHidden
		ifTrue: [ ^self ].

	self renderCanvasDivOn: html

]
