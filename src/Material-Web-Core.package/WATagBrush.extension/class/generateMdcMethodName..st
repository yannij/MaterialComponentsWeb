*Material-Web-Core
generateMdcMethodName: aCssClass
	| selectorName blockPart elementPart modifierPart index |

	blockPart := aCssClass.
	elementPart := ''.
	modifierPart := ''.

	index := blockPart findString: '__'.
	index > 0 ifTrue: [
		elementPart := blockPart copyFrom: index + 2 to: blockPart size.
		blockPart := blockPart copyFrom: 1 to: index].

	index := elementPart findString: '--'.
	index > 0 ifTrue: [
		modifierPart := elementPart copyFrom: index + 2 to: elementPart size.
		elementPart := elementPart copyFrom: 1 to: index].

	index := blockPart findString: '--'.
	index > 0 ifTrue: [
		modifierPart := blockPart copyFrom: index + 2 to: blockPart size.
		blockPart := blockPart copyFrom: 1 to: index].

	selectorName := ''.
	blockPart notEmpty
		ifTrue: [
			selectorName := selectorName, (self generateMdcSelectorFragment: blockPart)].

	elementPart notEmpty
		ifTrue: [
			selectorName := selectorName, '__', (self generateMdcSelectorFragment: elementPart)].

	modifierPart notEmpty
		ifTrue: [
			selectorName := selectorName, '_', (self generateMdcSelectorFragment: modifierPart)].

	^selectorName