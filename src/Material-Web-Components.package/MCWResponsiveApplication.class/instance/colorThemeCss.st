accessing
colorThemeCss
	| aStream |

	aStream := WriteStream on: String new.
	aStream nextPutAll: ':root {'.
	aStream nextPutAll: '--mdc-typography-font-family: Rubik, sans-serif;'.
	self settings colorTheme keysAndValuesDo: [:eachKey :eachValue |
		aStream
			nextPutAll: '--mdc-theme-'; nextPutAll: eachKey;
			nextPutAll: ': '; nextPutAll: eachValue; nextPut: $;;
			yourself].
	aStream nextPutAll: '}'.
	^aStream contents