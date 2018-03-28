instance creation
itemText: aString itemSecondaryText: aSecondaryString imageName: anImageName callback: aBlock

	^self new
		itemText: aString;
		itemSecondaryText: aSecondaryString;
		callback: aBlock;
		imageName: anImageName;
		yourself