initialization
popupMenuLayoutScript

	^'element = document.getElementById(''', self popupMenuLayoutId, ''');
element.MDCMenu.open = !element.MDCMenu.open'