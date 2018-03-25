rendering - tall and wide
renderExtraWideButtonOn: html
	| divId |

	divId := self extraWideId.

	html render: (MCWButton new
		buttonLabel: 'Toggle Extra-Wide - Temporary';
		onClickScript: (JSScript new add: (JSStream new
				nextPutAll: 'var ', divId, '=document.getElementById(''', divId, ''');';
				nextPutAll: divId, '.style.display = ', divId, '.style.display ? '''' : ''none''';
				yourself));
		yourself).
