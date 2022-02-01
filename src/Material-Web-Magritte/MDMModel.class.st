Class {
	#name : #MDMModel,
	#superclass : #Object,
	#classVars : [
		'DescriptionContainerClass'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MDMModel class >> descriptionContainerClass [
	"
	self descriptionContainerClass: MCWPriorityContainer.
	self descriptionContainerClass: MDQPriorityContainer.
	"

	^ DescriptionContainerClass ifNil: [ DescriptionContainerClass := MCWPriorityContainer ]
]

{ #category : #accessing }
MDMModel class >> descriptionContainerClass: anObject [
	DescriptionContainerClass := anObject
]

{ #category : #accessing }
MDMModel >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>

	^ self class descriptionContainerClass new
		"componentRenderer: MCWCssRenderer;"
		label: self class label;
		propertyAt: #cardWidth ifAbsentPut: [ 600 ];
		yourself
]
