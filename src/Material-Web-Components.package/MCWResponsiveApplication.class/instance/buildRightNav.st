initialization
buildRightNav

	^MCWDrawer new
		id: self rightNavDrawerId;
		list: self buildRightNavMenuList;
		beTemporaryDrawer;
		beDirectionToRightToLeft;
		yourself.
