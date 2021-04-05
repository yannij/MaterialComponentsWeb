accessing
materialComponentsWebUrlFragment
	| versionStirng |

	versionStirng := self materialVersion isEmpty
		ifTrue: [ 'latest' ]
		ifFalse: [ self materialVersion ].

	^ 'https://unpkg.com/material-components-web@<1s>/dist/material-components-web' expandMacrosWith: versionStirng