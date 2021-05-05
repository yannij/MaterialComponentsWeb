Class {
	#name : #MCWLayoutComponent,
	#superclass : #MCWComponent,
	#instVars : [
		'layout',
		'id',
		'title',
		'cssClass',
		'ariaLabel',
		'hidden'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #'instance creation' }
MCWLayoutComponent class >> id: anIdString [

	^ self new
		id: anIdString;
		yourself
]

{ #category : #'instance creation' }
MCWLayoutComponent class >> on: aResponsiveLayout [

	^ self new
		layout: aResponsiveLayout;
		yourself
]

{ #category : #accessing }
MCWLayoutComponent >> ariaLabel [
	^ ariaLabel
]

{ #category : #accessing }
MCWLayoutComponent >> ariaLabel: anObject [
	ariaLabel := anObject
]

{ #category : #actions }
MCWLayoutComponent >> beHidden [

	self hidden: true
]

{ #category : #actions }
MCWLayoutComponent >> beUnHidden [

	self hidden: false
]

{ #category : #accessing }
MCWLayoutComponent >> cssClass [
	^ cssClass
]

{ #category : #accessing }
MCWLayoutComponent >> cssClass: anObject [
	cssClass := anObject
]

{ #category : #testing }
MCWLayoutComponent >> hasAriaLabel [

	^ self ariaLabel notNil
]

{ #category : #testing }
MCWLayoutComponent >> hasTitle [

	^ self title notNil
]

{ #category : #accessing }
MCWLayoutComponent >> hidden [
	^ hidden
]

{ #category : #accessing }
MCWLayoutComponent >> hidden: anObject [
	hidden := anObject
]

{ #category : #accessing }
MCWLayoutComponent >> id [
	^ id
]

{ #category : #accessing }
MCWLayoutComponent >> id: anObject [
	id := anObject
]

{ #category : #initialization }
MCWLayoutComponent >> initialize [

	super initialize.

	"html renderer prunes a nil id value"
	"self id: nil."
	self hidden: false.

	"Set as needed, use hasZZZ"
	"
	self title: ''.
	self ariaLabel: ''.
	"

]

{ #category : #testing }
MCWLayoutComponent >> isHidden [

	^ self hidden
]

{ #category : #accessing }
MCWLayoutComponent >> layout [
	^ layout
]

{ #category : #accessing }
MCWLayoutComponent >> layout: anObject [
	layout := anObject
]

{ #category : #accessing }
MCWLayoutComponent >> title [
	^ title
]

{ #category : #accessing }
MCWLayoutComponent >> title: anObject [
	title := anObject
]
