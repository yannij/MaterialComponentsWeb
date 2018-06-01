initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'mcw-example-shrine'.
	"

	^self registerToDevelopment: 'mcw-example-shrine'
