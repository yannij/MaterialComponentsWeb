actions
adjustToolbarsTablet

	self topAppBar dense: false.
	"self topAppBar startSection: self rootComponent appBarStartSection."
	self topAppBar startSection do: [:each | each beUnHidden].
