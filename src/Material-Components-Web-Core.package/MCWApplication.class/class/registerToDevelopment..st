instance creation
registerToDevelopment: aName
	| app |

	WAAdmin applicationDefaults
		addParent: WADevelopmentConfiguration instance.

	app := WAAdmin register: self asApplicationAt: aName.
	"app
		addLibrary: MCWDevelopmentLibrary;
		addLibrary: MCWLibrary."
	^ app