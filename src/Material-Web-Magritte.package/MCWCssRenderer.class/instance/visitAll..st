visiting
visitAll: aCollection

	"super visitAll: aCollection"
	aCollection do: [ :each | self visit: each ] separatedBy: [ self visitDivider ]