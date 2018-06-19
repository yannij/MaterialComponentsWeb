updating
updateRootFonts: anHtmlRoot
	| fontNames |

	super updateRootFonts: anHtmlRoot.

	"fontNames := 'Roboto|Roboto+Condensed|Bree+Serif|Fontdiner+Swanky|Open+Sans|Oxygen+Mono|Pacifico'."
	fontNames := '|' join: (self buildFontChoices collect: [:eachChoice | eachChoice googleFontsFamily]).

	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://fonts.googleapis.com/css?family=', fontNames).
