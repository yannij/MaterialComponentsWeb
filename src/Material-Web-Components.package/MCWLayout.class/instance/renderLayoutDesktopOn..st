rendering
renderLayoutDesktopOn: html

	"self appBar isShortCollapsed
		ifTrue: [self sideNav cssClass: 'appBarPadding']
		ifFalse: [self sideNav cssClass: nil]."

	html render: self sideNav.
	html render: self topAppBar.

	html div
		mdcDrawerAppContent;
		"style: 'margin-top: ', self appBar marginHeight printString, 'px';
		style: 'display: inline-flex; flex-direction: row; flex-grow: 1; height: 100%; box-sizing: border-box;';"
		with: [
			html div
				mdcTopAppBar_fixedAdjust;
				with: [self renderContentAreaDesktopOn: html]].
	html div mdcTopAppBar_fixedAdjust;
		style: 'min-width: 320px; max-width: 320px';
		with: [html render: self sideSheet].
