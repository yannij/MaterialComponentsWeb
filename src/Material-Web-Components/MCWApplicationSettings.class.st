Class {
	#name : #MCWApplicationSettings,
	#superclass : #MCWModel,
	#instVars : [
		'fontSettings',
		'colorTheme'
	],
	#category : 'Material-Web-Components'
}

{ #category : #'instance creation' }
MCWApplicationSettings class >> newDefault [

	^self new
		fontSettings: MCWFontSettings new;
		colorTheme: MCWColorTheme new;
		yourself
]

{ #category : #accessing }
MCWApplicationSettings >> colorTheme [
	^ colorTheme
]

{ #category : #accessing }
MCWApplicationSettings >> colorTheme: anObject [
	colorTheme := anObject
]

{ #category : #accessing }
MCWApplicationSettings >> fontSettings [
	^ fontSettings
]

{ #category : #accessing }
MCWApplicationSettings >> fontSettings: anObject [
	fontSettings := anObject
]

{ #category : #actions }
MCWApplicationSettings >> setFont: aFont [

	self fontSettings setFont: aFont
]

{ #category : #actions }
MCWApplicationSettings >> setFontNamed: aFontName [

	self fontSettings setFontNamed: aFontName
]
