accessing
marginHeight

	^self isShortCollapsed ifTrue: [0] ifFalse: [self height]