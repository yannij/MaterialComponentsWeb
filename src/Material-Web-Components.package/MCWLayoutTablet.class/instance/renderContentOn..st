rendering
renderContentOn: html

	"self appBar isShortCollapsed
		ifTrue: [self sideNav cssClass: 'appBarPadding']
		ifFalse: [self sideNav cssClass: nil]."

	html render: self sideNav.

	html div
		mdcDrawerAppContent;
		with: [
			html render: self appBar.
			html div
				mdcTopAppBar_fixedAdjust;
				with: [self renderCanvasOn: html].
			html render: self sideSheet.
		].
