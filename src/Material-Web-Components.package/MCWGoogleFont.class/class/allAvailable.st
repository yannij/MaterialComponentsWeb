accessing
allAvailable

	AllAvailable isNil
		ifTrue: [AllAvailable := self allAvailableBuild].

	^ AllAvailable