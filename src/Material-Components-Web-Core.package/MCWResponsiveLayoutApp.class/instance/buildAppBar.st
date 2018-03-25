initialization
buildAppBar
	| toolbar |

	toolbar := MCWToolbar new
		title: 'App bar / primary toolbar';
		mcwStyle: 'background-color: #3F51B5';
		yourself.

	self isLayoutStructureDesktop not
		ifTrue: [
			toolbar
				startSection: {
					{'Menu'. 'menu'. self openSideNavScript}.
				}].

	self isLayoutStructureDesktop
		ifTrue: [
			toolbar
				endSection: {
					{'Download'. 'file_download'. nil}.
					{'Print this page'. 'print'. nil}.
					{'More'. 'more_vert'. self openAppBarItemMoreScript}.
				}]
		ifFalse: [
			toolbar
				endSection: {
					{'Right Nav'. 'more_horiz'. self openRidghtNavScript}.
					{'Download'. 'file_download'. nil}.
					{'Print this page'. 'print'. nil}.
					{'More'. 'more_vert'. self openAppBarItemMoreScript}.
					"('Bookmark this page'. 'bookmark'. '')."
				}
			].

	^toolbar
