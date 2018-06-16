accessing
paddingHeight

	^self isShortCollapsed ifTrue: [self height] ifFalse: [0]