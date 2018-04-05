accessing
subComponentsLazy

	subComponents isNil ifTrue: [subComponents := OrderedCollection new].
	^subComponents