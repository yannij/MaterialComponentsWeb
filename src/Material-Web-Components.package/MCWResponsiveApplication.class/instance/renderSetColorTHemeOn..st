rendering
renderSetColorTHemeOn: html
	| stream |

	stream := String new writeStream.

	stream nextPutAll: 'var bodyStyle = document.querySelector("body").style;'.
	self settings colorTheme themeItems keysAndValuesDo: [:eachKey :eachValue |
		stream
			nextPutAll: 'bodyStyle.setProperty("--mdc-theme-', eachKey, '", "#', eachValue asHexString, '");';
			yourself].

	html script with: stream contents.
