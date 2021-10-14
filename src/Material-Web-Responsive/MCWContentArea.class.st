Class {
	#name : #MCWContentArea,
	#superclass : #MCWLayoutComponent,
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
MCWContentArea >> renderContentOn: html [

	self component ifNil: [ ^ self ].

	html render: self component
]
