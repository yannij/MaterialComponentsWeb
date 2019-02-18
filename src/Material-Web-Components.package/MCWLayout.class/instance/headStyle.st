accessing
headStyle

	self isMobileStyle ifTrue: [^self headStyleMobile].
	self isTabletStyle ifTrue: [^self headStyleTablet].
	^self headStyleDesktop