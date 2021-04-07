Class {
	#name : #MCWFontSettings,
	#superclass : #MCWModel,
	#instVars : [
		'font',
		'fontChoices'
	],
	#category : 'Material-Web-Components'
}

{ #category : #accessing }
MCWFontSettings >> font [
	^ font
]

{ #category : #accessing }
MCWFontSettings >> font: anObject [
	font := anObject
]

{ #category : #accessing }
MCWFontSettings >> fontChoices [
	^ fontChoices
]

{ #category : #accessing }
MCWFontSettings >> fontChoices: anObject [
	fontChoices := anObject
]

{ #category : #accessing }
MCWFontSettings >> fontChoicesAdd: aGoogleFont [

	self fontChoices add: aGoogleFont

]

{ #category : #initialization }
MCWFontSettings >> initialize [

	super initialize.

	self fontChoices: OrderedCollection new.
	self fontChoicesAdd: (MCWGoogleFont fontNamed: 'Roboto').

	self font: self fontChoices first.

]

{ #category : #initialization }
MCWFontSettings >> setFont: aFont [

	self fontChoicesAdd: aFont.
	self font: aFont

]

{ #category : #initialization }
MCWFontSettings >> setFontNamed: aFontName [
	| fontChoice |

	fontChoice := MCWGoogleFont fontNamed: aFontName.

	fontChoice notNil ifTrue: [
		self setFont: fontChoice]

]
