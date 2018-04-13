instance creation
registerToDevelopment: aName
	| app |

	WAAdmin applicationDefaults
		addParent: WADevelopmentConfiguration instance.

	app := WAAdmin register: self asApplicationAt: aName.
	app
		addLibrary: JQDevelopmentLibrary;
		addLibrary: MCWDevelopmentLibrary;
		addLibrary: MCWCustomizableLibrary;
		yourself.
	^ app