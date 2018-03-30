initialization
buildAppBar
	| toolbar |

	toolbar := MCWToolbar new
		toolbarTitle: self appBarTitle;
		mcwStyle: 'background-color: #3F51B5';
		yourself.

	toolbar startSection: self appBarStartSection.

	toolbar endSection: self appBarEndSection.

	^toolbar
