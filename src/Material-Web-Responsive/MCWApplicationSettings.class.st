Class {
	#name : #MCWApplicationSettings,
	#superclass : #MCWModel,
	#instVars : [
		'mdcDensity',
		'mdcTypography',
		'mdcTheme'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MCWApplicationSettings >> denseView [

	^ self mdcDensity density < 0
]

{ #category : #initialization }
MCWApplicationSettings >> initialize [

	super initialize.

	self mdcDensity: MDCDensity new.
	self mdcTypography: MDCTypography new.
	self mdcTheme: MDCTheme new
]

{ #category : #accessing }
MCWApplicationSettings >> mdcDensity [
	^ mdcDensity
]

{ #category : #accessing }
MCWApplicationSettings >> mdcDensity: anObject [
	mdcDensity := anObject
]

{ #category : #accessing }
MCWApplicationSettings >> mdcTheme [
	^ mdcTheme
]

{ #category : #accessing }
MCWApplicationSettings >> mdcTheme: anObject [
	mdcTheme := anObject
]

{ #category : #accessing }
MCWApplicationSettings >> mdcTypography [
	^ mdcTypography
]

{ #category : #accessing }
MCWApplicationSettings >> mdcTypography: anObject [
	mdcTypography := anObject
]

{ #category : #accessing }
MCWApplicationSettings >> toggleDenseView [

	self mdcDensity density < 0
		ifTrue: [ self mdcDensity density: 0 ]
		ifFalse: [ self mdcDensity density: -1 ]
]
