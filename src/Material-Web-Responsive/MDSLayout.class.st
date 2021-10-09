Class {
	#name : #MDSLayout,
	#superclass : #MCWComponent,
	#instVars : [
		'app',
		'contentArea',
		'sideNav'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSLayout class >> defaultMaxWidth [

	^ 1920 "- 80" "decrease for scrollbar"
]

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
MDSLayout class >> on: aResponsiveApplication [

	^ self new
		app: aResponsiveApplication;
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
	^ contentArea
]

{ #category : #accessing }
MDSLayout >> contentArea: anObject [
	contentArea := anObject
]

{ #category : #initialization }
MDSLayout >> initialize [

	super initialize.

	"self maxWidth: self class defaultMaxWidth.
	self settingsView: (MCWApplicationSettingsView on: self).
	self screenStyle: self class layoutDesktop"
]

{ #category : #rendering }
MDSLayout >> renderContentOn: html [

	self renderLayoutOn: html
]

{ #category : #rendering }
MDSLayout >> renderLayoutOn: html [

	html div style: 'height: 100vh'; with: self sideNav.

	html div
		mdcDrawerAppContent;
		with: [ self contentArea ]
]

{ #category : #accessing }
MDSLayout >> sideNav [
	^ sideNav
]

{ #category : #accessing }
MDSLayout >> sideNav: anObject [
	sideNav := anObject
]
