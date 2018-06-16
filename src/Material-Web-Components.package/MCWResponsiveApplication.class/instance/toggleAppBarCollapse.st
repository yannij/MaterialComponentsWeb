actions
toggleAppBarCollapse

	self topAppBar shortCollapsed
		ifTrue: [self topAppBar short: false; shortCollapsed: false]
		ifFalse: [self topAppBar short: true; shortCollapsed: true]
