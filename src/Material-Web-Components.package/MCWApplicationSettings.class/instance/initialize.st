initialization
initialize

	super initialize.

	self fontChoices: OrderedCollection new.
	self buildFontChoices.

	"self font: self fontChoices first."
	self font: (MCWGoogleFont from: MCWGoogleFont list atRandom).

	self colorTheme: MCWColorTheme new