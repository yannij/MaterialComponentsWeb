Class {
	#name : #MDMModel,
	#superclass : #Object,
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MDMModel class >> descriptionContainerClass [

	^ MCWPriorityContainer

]

{ #category : #accessing }
MDMModel >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>

	^ self class descriptionContainerClass new
		componentRenderer: MCWCssRenderer;
		label: self class label;
		propertyAt: #cardWidth ifAbsentPut: [ 600 ];
		yourself
]
