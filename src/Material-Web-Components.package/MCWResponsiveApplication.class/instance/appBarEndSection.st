initialization
appBarEndSection
	| data settingsPopup |

	settingsPopup := self buildPopupMenuSettings.

	data := OrderedCollection new.
	data
		add: ((MCWAppBarMenuIcon materialIcon: 'settings') ariaLabel: 'Settings'; onClickScript: settingsPopup openScript; yourself);
		add: settingsPopup;
		yourself.

	"These buttons are here because persistent side nav causes toolbar to be pushed right"
	"5 timesRepeat: [data add: (self toolbarActions at: #bookmark)]."

	^data
