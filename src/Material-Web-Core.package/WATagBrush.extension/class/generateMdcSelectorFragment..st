*Material-Web-Core
generateMdcSelectorFragment: aBlockElementModifierPart
	"
	(self generateMdcTagSelectorFragment: 'aaa-bbb-ccc') = 'aaaBbbCcc'
	"

	^('' join: ((aBlockElementModifierPart substrings: '-') collect: [:each | each asCamelCase])) asValidSelector
