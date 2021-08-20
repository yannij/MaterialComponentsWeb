Class {
	#name : #MCWActionColumn,
	#superclass : #MAActionColumn,
	#instVars : [
		'commandBlock'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MCWActionColumn >> commandBlock [
	^ commandBlock
]

{ #category : #accessing }
MCWActionColumn >> commandBlock: anObject [
	commandBlock := anObject
]

{ #category : #rendering }
MCWActionColumn >> renderCellFormContent: anObject on: html [

	html submitButton
		callback: [ self commandBlock value: anObject ];
		text: '>'
]

{ #category : #rendering }
MCWActionColumn >> renderCellLinkContent: anObject on: html [

	"html anchor
		callback: [ self commandBlock value: anObject ];
		with: '>'"

	html button mdcButton; mdcButton_unelevated;
		onClick: ((html jQuery ajax)
			callback: [ self commandBlock value: anObject ];
			onComplete: html javascript refresh);
		with: [ html span mdcMaterialIcons; mdcIconButton__icon; with: 'chevron_right' ]
]
