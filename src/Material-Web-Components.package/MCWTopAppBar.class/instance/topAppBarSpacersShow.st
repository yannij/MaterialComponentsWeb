actions
topAppBarSpacersShow
	"Workaround to handle problem with dismissable drawer that obscures right side of appBar"

	self endSection do: [:each |
		each iconName = 'bookmark' ifTrue: [each beUnHidden]]