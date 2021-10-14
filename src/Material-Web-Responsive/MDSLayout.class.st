Class {
	#name : #MDSLayout,
	#superclass : #WAComponent,
	#instVars : [
		'app'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSLayout class >> layoutDesktop [

	^ #large
]

{ #category : #accessing }
MDSLayout class >> layoutLaptop [

	^ #medium
]

{ #category : #accessing }
MDSLayout class >> layoutPhone [

	^ #'extra-small'
]

{ #category : #accessing }
MDSLayout class >> layoutTablet [

	^ #small
]

{ #category : #'instance creation' }
MDSLayout class >> on: aResponsiveApp [

	^ self new
		app: aResponsiveApp;
		yourself
]

{ #category : #accessing }
MDSLayout >> app [
	^ app
]

{ #category : #accessing }
MDSLayout >> app: anObject [
	app := anObject
]

{ #category : #accessing }
MDSLayout >> contentArea [

	^ self app contentArea
]

{ #category : #rendering }
MDSLayout >> renderContentOn: html [

	self subclassResponsibility
]

{ #category : #accessing }
MDSLayout >> sideNav [

	^ self app sideNav
]

{ #category : #accessing }
MDSLayout >> sideSheet [

	^ self app sideSheet
]

{ #category : #accessing }
MDSLayout >> topAppBar [

	^ self app topAppBar
]
