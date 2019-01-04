rendering
renderListOn: html

	self listStyle = #singleLine
		ifTrue: [self renderListSingleLineAjaxOn: html]
		ifFalse: [self renderListTwoLineAjaxOn: html]