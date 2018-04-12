actions
colorThemeExampleClear
	| libraryHandler library |

	self colorTheme removeAll.

	libraryHandler := (WADispatcher default handlerAt: 'files') libraryAt: 'MCWCustomizableLibrary' ifAbsent: [].
	libraryHandler notNil
		ifTrue: [
			library := libraryHandler default.
			library colorThemeCss: self colorThemeCss].