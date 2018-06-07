initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'material/catalog'.
	"

	^self registerToDevelopment: 'material/catalog'
