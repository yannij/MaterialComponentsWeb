Class {
	#name : #MCWPriorityContainer,
	#superclass : #MAPriorityContainer,
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

{ #category : #initialization }
MCWPriorityContainer >> initialize [

	super initialize.

	self componentRenderer: self class defaultComponentRenderer
]
