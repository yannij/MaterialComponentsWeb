actions
adjustLayoutStructure

	self sideNav bePersistentDrawer; beDismissed.

	"self sideSheet ifNotNil: [:value |
		value beDirectionLeftToRight]."

	self adjustToolbars.
