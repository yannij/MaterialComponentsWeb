Class {
	#name : #MCWApplicationSettings,
	#superclass : #MCWModel,
	#instVars : [
		'mdcDensity',
		'mdcTheme',
		'mdcTypography',
		'autoResponsive'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MCWApplicationSettings >> autoResponsive [

	^ autoResponsive
]

{ #category : #accessing }
MCWApplicationSettings >> autoResponsive: anObject [

	autoResponsive := anObject
]

{ #category : #accessing }
MCWApplicationSettings >> autoResponsiveOff [

	self autoResponsive: false
]

{ #category : #accessing }
MCWApplicationSettings >> autoResponsiveOn [

	self autoResponsive: true
]

{ #category : #accessing }
MCWApplicationSettings >> denseView [

	^ self mdcDensity density < 0
]

{ #category : #initialization }
MCWApplicationSettings >> initialize [

	super initialize.

	self autoResponsive: true.
	self mdcDensity: MDCDensity new.
	self mdcTheme: MDCTheme new.
	self mdcTypography: MDCTypography new
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
MCWApplicationSettings >> toggleAutoResponsive [

	self autoResponsive: self autoResponsive not
]

{ #category : #accessing }
MCWApplicationSettings >> toggleDenseView [

	self mdcDensity density < 0
		ifTrue: [ self mdcDensity density: 0 ]
		ifFalse: [ self mdcDensity density: -1 ]
]
