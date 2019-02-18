initialization
buildSideSheet

	^MCWDrawer new
		id: self rightNavDrawerId;
		list: self buildSideSheetList;
		beModalDrawer;
		beDirectionToRightToLeft;
		yourself