initialization
buildFontChoices
	| list |

	list := MCWGoogleFont list.

	#(
'Fontdiner Swanky'
'Oxygen Mono'
'Spectral'
'Roboto Condensed'
'Roboto'
'Bree Serif'
'Open Sans'
	) do: [:eachFontName | | data |
		data := list detect: [:each | each first = eachFontName] ifNone: [nil].
		data notNil ifTrue: [self fontChoicesAdd: (MCWGoogleFont from: data)]]
