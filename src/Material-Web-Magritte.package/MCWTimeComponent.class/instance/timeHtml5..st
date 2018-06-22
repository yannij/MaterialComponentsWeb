accessing
timeHtml5: aString

	aString isEmpty ifFalse: [
		self value: (Time fromString: aString) ]