initialization
initialize

	super initialize.

	"html renderer prunes a nil id value"
	"self id: nil."
	self hidden: false.

	"Set as needed, use hasZZZ"
	"
	self title: ''.
	self ariaLabel: ''.
	"
