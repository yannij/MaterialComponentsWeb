Class {
	#name : #MDSSideSheet,
	#superclass : #MDSComponent,
	#instVars : [
		'component'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSSideSheet >> component [
	^ component
]

{ #category : #accessing }
MDSSideSheet >> component: anObject [
	component := anObject
]

{ #category : #rendering }
MDSSideSheet >> renderContentOn: html [

	self isHidden ifTrue: [ ^ self ].
	self component ifNil: [ ^ self ].

	html render: self component

]
