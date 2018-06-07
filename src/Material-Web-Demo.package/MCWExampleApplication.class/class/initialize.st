initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'material/example-old'.
	"

	^self registerToDevelopment: 'material/example-old'
