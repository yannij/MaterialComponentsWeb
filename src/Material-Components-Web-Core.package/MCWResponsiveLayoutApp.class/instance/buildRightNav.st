initialization
buildRightNav

	^MCWDrawer new
		id: self rightNavDrawerId;
		list: {'star' -> 'Right Nav 1'. 'star' -> 'Right Nav 2'};
		beTemporaryDrawer;
		beDirectionToRightToLeft;
		yourself.
