initialization
openAppBarItemMoreScript

	^'element = document.getElementById(''', self appBarItemMoreId, ''');
element.MDCMenu.open = !element.MDCMenu.open'