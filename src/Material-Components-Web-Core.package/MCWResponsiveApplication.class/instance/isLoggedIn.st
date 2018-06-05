testing
isLoggedIn

	self session isNil
		ifTrue: [^false].

	^self session properties includesKey: #authenticatedUser