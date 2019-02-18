actions
chooseColors

	self layout contentArea component notNil
		ifTrue: [self layout contentArea component: nil]
		ifFalse: [self layout contentArea component: (self settings colorTheme asComponent addValidatedForm)]
