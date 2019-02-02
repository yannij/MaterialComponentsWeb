actions
adjustToolbars

	self appBar dense: false.
	self appBar startSection: self content appBarStartSection.
	"self appBar startSection do: [:each |
		each iconName = 'menu' ifTrue: [each beHidden]]."
