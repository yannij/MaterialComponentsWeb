actions
chooseColors

	self canvas view notNil
		ifTrue: [self canvas view: nil]
		ifFalse: [self canvas view: (self settings colorTheme asComponent addValidatedForm)]
