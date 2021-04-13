Class {
	#name : #MCWPriorityContainer,
	#superclass : #MAPriorityContainer,
	#instVars : [
		'componentClassMap'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MCWPriorityContainer >> componentClass [

	^ MCWContainerComponent
]

{ #category : #accessing }
MCWPriorityContainer >> componentClassMap [
	^ componentClassMap
]

{ #category : #accessing }
MCWPriorityContainer >> componentClassMap: anObject [
	componentClassMap := anObject
]

{ #category : #accessing }
MCWPriorityContainer >> componentRenderer [

	^ MCWCssRenderer
]

{ #category : #initialization }
MCWPriorityContainer >> initialize [

	super initialize.
	self componentClassMap: Dictionary new.

]
