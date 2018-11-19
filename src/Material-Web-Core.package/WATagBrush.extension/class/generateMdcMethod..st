*Material-Web-Core
generateMdcMethod: aCssClass
	| selectorName code |

	selectorName := self generateMdcMethodName: aCssClass.
	Transcript crShow: selectorName; show: ' <<<< '; show: aCssClass.

	code := selectorName, String cr, String cr, String tab, 'self class: ', aCssClass printString.

	self compile: code classified: '*Material-Web-Core-generated'