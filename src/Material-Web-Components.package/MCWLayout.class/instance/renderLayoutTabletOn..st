rendering
renderLayoutTabletOn: html

	"self appBar isShortCollapsed
		ifTrue: [self sideNav cssClass: 'appBarPadding']
		ifFalse: [self sideNav cssClass: nil]."

	html render: self sideNav.

	html div
		mdcDrawerAppContent;
		with: [
			html render: self topAppBar.
			html div
				mdcTopAppBar_fixedAdjust;
				with: [self renderContentAreaTabletOn: html].
		].

	html div
		mdcTopAppBar_fixedAdjust;
		with: [html render: self sideSheet]
