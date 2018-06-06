initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'mcw-demo-catalog'.
	"

	^self registerToDevelopment: 'mcw-demo-catalog'
