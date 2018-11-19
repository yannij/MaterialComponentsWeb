rendering - catalog page
renderCatalogPage: aPageName on: html
	| selector |

	selector := ('renderCatalogPage', self pageName capitalized, 'On:') asSymbol.

	(self respondsTo: selector)
		ifTrue: [^self perform: selector with: html].

	"html text: selector printString; break.
	html text: 'TODO: ', self pageName capitalized."

	html section class: 'hero'; with: [
		html heading level2; mdcTypography_headline1; with: self pageName capitalized, ' - To Do']