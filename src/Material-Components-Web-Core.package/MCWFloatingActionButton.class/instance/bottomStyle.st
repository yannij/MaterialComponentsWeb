rendering
bottomStyle

	^'bottom: {1}rem' format: {self isMiniFab ifTrue: ['2.5'] ifFalse: ['2']}