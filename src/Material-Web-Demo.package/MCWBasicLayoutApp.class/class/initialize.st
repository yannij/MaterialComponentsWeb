initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'material/layout'.
	"

	^self registerToDevelopment: 'material/layout'
