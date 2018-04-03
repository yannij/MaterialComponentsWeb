actions
adjustToolbarsPersistedSideNav: aBoolean
	"Workaround to handle problem with persisted drawer that obscures right side of appBar"

	aBoolean
		ifTrue: [
			self appBar endSection do: [:each |
				each iconName = 'bookmark' ifTrue: [each beUnHidden]]]
		ifFalse: [
			self appBar endSection do: [:each |
				each iconName = 'bookmark' ifTrue: [each beHidden]]]
