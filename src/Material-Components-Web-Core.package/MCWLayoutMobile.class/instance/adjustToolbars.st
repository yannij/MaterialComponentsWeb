actions
adjustToolbars

	self appBar startSection: self content appBarStartSection.
	self appBar startSection do: [:each | each beUnHidden].

	self appBar endSection do: [:each | each beUnHidden].

	self appBar endSection do: [:each |
		each iconName = 'bookmark' ifTrue: [each beHidden]].
