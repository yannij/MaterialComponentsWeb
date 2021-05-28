Class {
	#name : #MCWPriorityContainer,
	#superclass : #MAPriorityContainer,
	#instVars : [
		'componentClassMap'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MCWPriorityContainer class >> defaultComponentClass [

	^ MCWContainerComponent
]

{ #category : #accessing }
MCWPriorityContainer class >> defaultComponentRenderer [

	^ MCWCssRenderer
]

{ #category : #accessing }
MCWPriorityContainer >> componentClassMap [
	^ componentClassMap
]

{ #category : #accessing }
MCWPriorityContainer >> componentClassMap: anObject [
	componentClassMap := anObject
]

{ #category : #initialization }
MCWPriorityContainer >> initialize [

	super initialize.
	self componentClassMap: Dictionary new.

]
