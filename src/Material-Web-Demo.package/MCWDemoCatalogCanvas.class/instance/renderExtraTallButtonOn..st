rendering - drawer
renderExtraTallButtonOn: html
	| divId |

	divId := self extraTallId.

	html render: (MCWButton new
		actionLabel: 'Toggle Extra-Tall - Temporary';
		onClickScript: (JSScript new add: (JSStream new
				nextPutAll: 'var ', divId, '=document.getElementById(''', divId, ''');';
				nextPutAll: divId, '.style.display = ', divId, '.style.display ? '''' : ''none''';
				yourself));
		yourself).
