initialization
buildSideSheet

	true ifTrue: [ ^nil ].

	^MCWDrawer new
		id: self rightNavDrawerId;
		list: self buildSideSheetList;
		beTemporaryDrawer;
		beDirectionToRightToLeft;
		yourself.
