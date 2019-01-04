actions
beDismissed

	self isDismissed: true.
	self session presenter ifNotNil: [:value | value topAppBar topAppBarSpacersHide]