*Material-Web-Core
generateMdcTagsFrom: aFilename
	"
	MDC uses BEM naming convention:
		.block {}
		.block__element {}
		.block--modifier {}

	self generateMdcTagsFrom: 'test.dat'

aaaBbbCcc <<<< aaa-bbb-ccc
aaaBbbCcc_eeeFffGgg <<<< aaa-bbb-ccc__eee-fff-ggg
aaaBbbCcc__xxxYyyZzz <<<< aaa-bbb-ccc--xxx-yyy-zzz
aaaBbbCcc_eeeFffGgg__xxxYyyZzz <<<< aaa-bbb-ccc__eee-fff-ggg--xxx-yyy-zzz

	self generateMdcTagsFrom: 'mdc.dat'
	"
	| reference |

	reference := FileSystem disk workingDirectory / aFilename.
	reference readStreamDo: [ :stream |
		[stream atEnd] whileFalse: [
			| nextLine |
			nextLine := stream upTo: Character lf.
			self generateMdcMethod: nextLine
		].
	]