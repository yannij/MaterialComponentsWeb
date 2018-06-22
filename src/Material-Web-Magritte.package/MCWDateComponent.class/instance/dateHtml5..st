accessing
dateHtml5: aString

	aString isEmpty ifFalse: [
		self value: (Date fromString: aString) ]