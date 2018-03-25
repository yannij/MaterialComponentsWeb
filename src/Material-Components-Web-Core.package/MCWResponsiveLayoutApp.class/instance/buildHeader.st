initialization
buildHeader

	^MCWHeader new
		addSubComponent: self appBar;
		yourself