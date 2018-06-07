initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'material/shrine'.
	"

	^self registerToDevelopment: 'material/shrine'
