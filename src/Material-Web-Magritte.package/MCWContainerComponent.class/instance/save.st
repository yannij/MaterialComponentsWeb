actions
save
	self validate ifFalse: [ ^ self ].
	self commit.
	self model class isVoyageRoot
		ifTrue: [self session presenter saveObject: self model].
	self answer: self model