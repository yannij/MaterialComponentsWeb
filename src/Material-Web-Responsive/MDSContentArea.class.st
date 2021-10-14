Class {
	#name : #MDSContentArea,
	#superclass : #MDSComponent,
	#instVars : [
		'component'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSContentArea >> component [
	^ component
]

{ #category : #accessing }
MDSContentArea >> component: anObject [
	component := anObject
]

{ #category : #rendering }
MDSContentArea >> renderContentOn: html [

	self component ifNil: [ ^ self ].

	html render: self component
]
