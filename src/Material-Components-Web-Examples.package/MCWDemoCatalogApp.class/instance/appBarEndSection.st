initialization
appBarEndSection
	| data |

	data := OrderedCollection new.

	data
		add: (self toolbarActions at: #toys);
		add: (self toolbarActions at: #toysPopup);
		yourself.

	"These buttons are here because persistent side nav causes toolbar to be pushed right"
	5 timesRepeat: [data add: (self toolbarActions at: #bookmark)].

	^data
