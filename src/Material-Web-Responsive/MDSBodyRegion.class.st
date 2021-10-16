Class {
	#name : #MDSBodyRegion,
	#superclass : #MDSComponent,
	#instVars : [
		'component'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSBodyRegion >> component [
	^ component
]

{ #category : #accessing }
MDSBodyRegion >> component: anObject [
	component := anObject
]

{ #category : #rendering }
MDSBodyRegion >> renderContentOn: html [

	self component ifNil: [ ^ self ].

	html render: self component
]
