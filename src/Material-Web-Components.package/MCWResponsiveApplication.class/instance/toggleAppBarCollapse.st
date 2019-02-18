actions
toggleAppBarCollapse

	self layout topAppBar shortCollapsed
		ifTrue: [self layout topAppBar short: false; shortCollapsed: false]
		ifFalse: [self layout topAppBar short: true; shortCollapsed: true; dense: false]
