Class {
	#name : #MDMApplicationSettings,
	#superclass : #MDMModel,
	#instVars : [
		'mdcDensity',
		'mdcTheme',
		'mdcTypography',
		'autoResponsive'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MDMApplicationSettings >> autoResponsive [

	^ autoResponsive
]

{ #category : #accessing }
MDMApplicationSettings >> autoResponsive: anObject [

	autoResponsive := anObject
]

{ #category : #accessing }
MDMApplicationSettings >> autoResponsiveOff [

	self autoResponsive: false
]

{ #category : #accessing }
MDMApplicationSettings >> autoResponsiveOn [

	self autoResponsive: true
]

{ #category : #accessing }
MDMApplicationSettings >> denseView [

	^ self mdcDensity density < 0
]

{ #category : #initialization }
MDMApplicationSettings >> initialize [

	super initialize.

	self autoResponsive: true.
	self mdcDensity: MDMDensity new.
	self mdcTheme: MDMTheme new.
	self mdcTypography: MDMTypography new
]

{ #category : #accessing }
MDMApplicationSettings >> mdcDensity [
	^ mdcDensity
]

{ #category : #accessing }
MDMApplicationSettings >> mdcDensity: anObject [
	mdcDensity := anObject
]

{ #category : #accessing }
MDMApplicationSettings >> mdcTheme [
	^ mdcTheme
]

{ #category : #accessing }
MDMApplicationSettings >> mdcTheme: anObject [
	mdcTheme := anObject
]

{ #category : #accessing }
MDMApplicationSettings >> mdcTypography [
	^ mdcTypography
]

{ #category : #accessing }
MDMApplicationSettings >> mdcTypography: anObject [
	mdcTypography := anObject
]

{ #category : #accessing }
MDMApplicationSettings >> toggleAutoResponsive [

	self autoResponsive: self autoResponsive not
]

{ #category : #accessing }
MDMApplicationSettings >> toggleDenseView [

	self mdcDensity density < 0
		ifTrue: [ self mdcDensity density: 0 ]
		ifFalse: [ self mdcDensity density: -1 ]
]
