*Material-Web-CoreExtra
ariaSelected: aBoolean

	self attributeAt: 'aria-selected' put: (aBoolean ifTrue: ['true'] ifFalse: ['false'])