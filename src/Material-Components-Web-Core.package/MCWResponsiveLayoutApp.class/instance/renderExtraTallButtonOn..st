rendering - tall and wide
renderExtraTallButtonOn: html
	| divId |

	divId := self extraTallId.

	html render: (MCWButton new
		buttonLabel: 'Toggle Extra-Tall - Temporary';
		onClickScript: (JSScript new add: (JSStream new
				nextPutAll: 'var ', divId, '=document.getElementById(''', divId, ''');';
				nextPutAll: divId, '.style.display = ', divId, '.style.display ? '''' : ''none''';
				yourself));
		yourself).
