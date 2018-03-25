accessing
bodyTagClass

	self isLayoutStructureMobile
		ifTrue: [^'body-mobile'].

	self isLayoutStructureTablet
		ifTrue: [^'body-tablet'].

	self isLayoutStructureDesktop
		ifTrue: [^'body-desktop'].

	^'body-tablet'