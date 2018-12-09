initialization
buildSideSheet

	true ifTrue: [ ^nil ].

	^MCWDrawer new
		id: self rightNavDrawerId;
		list: self buildSideSheetList;
		beModalDrawer;
		beDirectionToRightToLeft;
		yourself.
