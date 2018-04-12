initialization
popupMenuSettingsScript

	^'element = document.getElementById(''', self popupMenuSettingsId, ''');
element.MDCMenu.open = !element.MDCMenu.open'