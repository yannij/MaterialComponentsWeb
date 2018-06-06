accessing
colorThemeCss
	| aStream |

	aStream := WriteStream on: String new.
	aStream nextPutAll: ':root {'.
	self colorTheme keysAndValuesDo: [:eachKey :eachValue |
		aStream
			nextPutAll: '--mdc-theme-'; nextPutAll: eachKey;
			nextPutAll: ': '; nextPutAll: eachValue; nextPut: $;;
			yourself].
	aStream nextPutAll: '}'.
	^aStream contents