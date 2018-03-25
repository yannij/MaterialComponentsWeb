initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: 'mcw-layout-structure'.
	"

	^self registerToDevelopment: 'mcw-layout-structure'
