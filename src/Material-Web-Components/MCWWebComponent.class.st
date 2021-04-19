Class {
	#name : #MCWWebComponent,
	#superclass : #MCWComponent,
	#instVars : [
		'id',
		'title',
		'cssClass',
		'ariaLabel',
		'hidden',
		'mcwStyle'
	],
	#category : #'Material-Web-Components'
}

{ #category : #'instance creation' }
MCWWebComponent class >> id: anIdString [

	^ self new
		id: anIdString;
		yourself
]

{ #category : #accessing }
MCWWebComponent >> ariaLabel [
	^ ariaLabel
]

{ #category : #accessing }
MCWWebComponent >> ariaLabel: anObject [
	ariaLabel := anObject
]

{ #category : #actions }
MCWWebComponent >> beHidden [

	self hidden: true
]

{ #category : #actions }
MCWWebComponent >> beUnHidden [

	self hidden: false
]

{ #category : #accessing }
MCWWebComponent >> cssClass [
	^ cssClass
]

{ #category : #accessing }
MCWWebComponent >> cssClass: anObject [
	cssClass := anObject
]

{ #category : #testing }
MCWWebComponent >> hasAriaLabel [

	^ self ariaLabel notNil
]

{ #category : #testing }
MCWWebComponent >> hasTitle [

	^ self title notNil
]

{ #category : #accessing }
MCWWebComponent >> hidden [
	^ hidden
]

{ #category : #accessing }
MCWWebComponent >> hidden: anObject [
	hidden := anObject
]

{ #category : #accessing }
MCWWebComponent >> id [
	^ id
]

{ #category : #accessing }
MCWWebComponent >> id: anObject [
	id := anObject
]

{ #category : #initialization }
MCWWebComponent >> initialize [

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
MCWWebComponent >> isHidden [

	^ self hidden
]

{ #category : #accessing }
MCWWebComponent >> mcwStyle [
	^ mcwStyle
]

{ #category : #accessing }
MCWWebComponent >> mcwStyle: anObject [
	mcwStyle := anObject
]

{ #category : #accessing }
MCWWebComponent >> title [
	^ title
]

{ #category : #accessing }
MCWWebComponent >> title: anObject [
	title := anObject
]
