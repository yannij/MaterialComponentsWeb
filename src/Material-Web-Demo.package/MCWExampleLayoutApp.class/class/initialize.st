initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'mcw-example-layout'.
	"

	^self registerToDevelopment: 'mcw-example-layout'
