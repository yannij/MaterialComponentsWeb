actions
colorThemeExample
	| libraryHandler library |

	#(
"('primary' '#3f51b5')"
('primary' 'green')
('primary-light' '#757de8')
('primary-dark' '#002984')
('secondary' '#e91e63')
('secondary-light' '#ff6090')
('secondary-dark' '#b0003a')
('background' '#fff')
	) do: [:each |
		self colorTheme at: each first put: each second].

	libraryHandler := (WADispatcher default handlerAt: 'files') libraryAt: 'MCWCustomizableLibrary' ifAbsent: [].
	libraryHandler notNil
		ifTrue: [
			library := libraryHandler default.
			library colorThemeCss: self colorThemeCss].