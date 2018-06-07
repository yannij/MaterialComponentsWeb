initialization
buildSideSheet

	^MCWDrawer new
		id: self rightNavDrawerId;
		list: self buildSideSheetList;
		beTemporaryDrawer;
		beDirectionToRightToLeft;
		yourself.
