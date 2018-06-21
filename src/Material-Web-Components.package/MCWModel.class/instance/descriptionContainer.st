accessing
descriptionContainer
	"Return the default description container."
	<magritteContainer>

	^self class descriptionContainerClass new
		label: self class label;
		propertyAt: #cardWidth ifAbsentPut: [600];
		yourself