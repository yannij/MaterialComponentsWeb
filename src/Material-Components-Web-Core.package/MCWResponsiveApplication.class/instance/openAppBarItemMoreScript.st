initialization
openAppBarItemMoreScript

	^'element = document.getElementById(''', self appBarPopupMenuId, ''');
element.MDCMenu.open = !element.MDCMenu.open'