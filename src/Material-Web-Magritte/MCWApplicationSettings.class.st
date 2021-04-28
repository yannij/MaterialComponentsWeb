Class {
	#name : #MCWApplicationSettings,
	#superclass : #MCWModel,
	#instVars : [
		'fontSettings',
		'colorTheme',
		'denseView'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #'instance creation' }
MCWApplicationSettings class >> newDefault [

	^ self new
		fontSettings: MCWFontSettings new;
		colorTheme: MCWColorTheme new;
		denseView: true;
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
MCWApplicationSettings >> denseView [
	^ denseView
]

{ #category : #accessing }
MCWApplicationSettings >> denseView: anObject [
	denseView := anObject
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

{ #category : #accessing }
MCWApplicationSettings >> toggleDenseView [

	self denseView: self denseView not
]
