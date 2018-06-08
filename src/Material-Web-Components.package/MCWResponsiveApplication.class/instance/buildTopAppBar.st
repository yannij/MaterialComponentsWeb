initialization
buildTopAppBar

	^MCWTopAppBar new
		toolbarTitle: self appBarTitle;
		startSection: self appBarStartSection;
		endSection: self appBarEndSection;
		yourself
