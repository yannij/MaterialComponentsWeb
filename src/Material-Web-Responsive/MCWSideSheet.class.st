Class {
	#name : #MCWSideSheet,
	#superclass : #MCWUserInterfaceRegion,
	#instVars : [
		'component'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MCWSideSheet >> component [
	^ component
]

{ #category : #accessing }
MCWSideSheet >> component: anObject [
	component := anObject
]

{ #category : #rendering }
MCWSideSheet >> renderCanvasOn: html [

	self component ifNil: [ ^ self ].

	html render: self component

]

{ #category : #rendering }
MCWSideSheet >> renderContentOn: html [

	self isHidden ifTrue: [ ^ self ].

	self renderCanvasOn: html

]