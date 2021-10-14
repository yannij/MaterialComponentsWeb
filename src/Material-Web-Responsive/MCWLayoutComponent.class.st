Class {
	#name : #MCWLayoutComponent,
	#superclass : #MDSComponent,
	#instVars : [
		'layout'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #'instance creation' }
MCWLayoutComponent class >> on: aResponsiveLayout [

	^ self new
		layout: aResponsiveLayout;
		yourself
]

{ #category : #accessing }
MCWLayoutComponent >> layout [
	^ layout
]

{ #category : #accessing }
MCWLayoutComponent >> layout: anObject [
	layout := anObject
]
