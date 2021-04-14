Class {
	#name : #MCWModel,
	#superclass : #Object,
	#category : #'Material-Web-Components'
}

{ #category : #accessing }
MCWModel class >> descriptionContainerClass [

	^ MCWPriorityContainer

]

{ #category : #accessing }
MCWModel >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>

	^ self class descriptionContainerClass new
		label: self class label;
		propertyAt: #cardWidth ifAbsentPut: [ 600 ];
		yourself
]
