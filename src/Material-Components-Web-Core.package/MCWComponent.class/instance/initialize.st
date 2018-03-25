initialization
initialize

	super initialize.

	"Lazy initialization"
	"self subComponents: nil."

	"html renderer prunes a nil id value"
	"self id: nil."
	self hidden: false.
