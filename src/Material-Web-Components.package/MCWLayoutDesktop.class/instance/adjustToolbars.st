actions
adjustToolbars

	self appBar dense: true.
	self appBar startSection: self content appBarStartSection.
	"self appBar startSection do: [:each |
		each iconName = 'menu' ifTrue: [each beHidden]]."
