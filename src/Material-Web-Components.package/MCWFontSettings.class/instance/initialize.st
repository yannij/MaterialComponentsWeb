initialization
initialize

	super initialize.

	self fontChoices: OrderedCollection new.
	self fontChoicesAdd: (MCWGoogleFont fontNamed: 'Roboto').

	self font: self fontChoices first.
