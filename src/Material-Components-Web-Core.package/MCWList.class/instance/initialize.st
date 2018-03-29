initialization
initialize

	super initialize.

	self selectedIndex: 0.
	self listItems: OrderedCollection new.

	"Check for nil, when rendering"
	"self subheading: nil."
