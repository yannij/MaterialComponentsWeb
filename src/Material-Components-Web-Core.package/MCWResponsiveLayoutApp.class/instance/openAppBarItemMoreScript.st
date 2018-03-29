initialization
openAppBarItemMoreScript

	^'element = document.getElementById(''', self appBarMenuId, ''');
element.MDCMenu.open = !element.MDCMenu.open'