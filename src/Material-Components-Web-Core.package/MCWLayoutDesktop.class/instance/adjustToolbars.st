actions
adjustToolbars

	self appBar startSection: self content appBarStartSection.
	self appBar startSection do: [:each |
		each iconName = 'menu' ifTrue: [each beHidden]].

	self appBar endSection do: [:each |
		each iconName = 'more_horiz' ifTrue: [each beHidden]].
