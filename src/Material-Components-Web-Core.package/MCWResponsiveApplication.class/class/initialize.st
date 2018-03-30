initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'mcw-responsive-layout'.
	"

	^self registerToDevelopment: 'mcw-responsive-layout'
