initialization
buildSideNav

	^MCWDrawer new
		id: self sideNavDrawerId;
		list: {'star' -> 'Side Nav 1'. 'star' -> 'Side Nav 2'. 'star' -> 'Side Nav 3'. 'star' -> 'Side Nav 4'};
		yourself.
