initialization
initialize
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^self registerToDevelopment: self applicationPath
