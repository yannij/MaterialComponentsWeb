initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'mcw-example'.
	"

	^self registerToDevelopment: 'mcw-example'
