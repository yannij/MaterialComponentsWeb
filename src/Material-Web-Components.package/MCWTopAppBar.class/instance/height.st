accessing
height

	^self isShort ifTrue: [56] ifFalse: [self isDense ifTrue: [48] ifFalse: [64]]