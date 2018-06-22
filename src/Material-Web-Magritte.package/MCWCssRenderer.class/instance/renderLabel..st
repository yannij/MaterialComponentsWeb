rendering
renderLabel: aDescription
	"Do nothing. #renderElementOn: also does the label"

	(aDescription isKindOf: MAColorDescription)
		ifTrue: [super renderLabel: aDescription]