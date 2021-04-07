Class {
	#name : #MCWAppBar,
	#superclass : #MCWWebComponent,
	#instVars : [
		'toolbarTitle',
		'startSection',
		'endSection'
	],
	#category : 'Material-Web-Components'
}

{ #category : #accessing }
MCWAppBar >> endSection [
	^ endSection
]

{ #category : #accessing }
MCWAppBar >> endSection: anObject [
	endSection := anObject
]

{ #category : #initialization }
MCWAppBar >> initialize [

	super initialize.

	self toolbarTitle: ''.
	self startSection: OrderedCollection new.
	self endSection: OrderedCollection new.

]

{ #category : #rendering }
MCWAppBar >> renderContentOn: html [

	self subclassResponsibility

]

{ #category : #accessing }
MCWAppBar >> startSection [
	^ startSection
]

{ #category : #accessing }
MCWAppBar >> startSection: anObject [
	startSection := anObject
]

{ #category : #accessing }
MCWAppBar >> toolbarTitle [
	^ toolbarTitle
]

{ #category : #accessing }
MCWAppBar >> toolbarTitle: anObject [
	toolbarTitle := anObject
]
