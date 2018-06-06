actions
adjustToolbars

	self appBar startSection: self content appBarStartSection.
	self appBar startSection do: [:each | each beUnHidden].

	self sideNav isPersisted
		ifTrue: [self appBar endSection do: [:each | each beUnHidden]].
