Extension { #name : #WATagBrush }

{ #category : #'*Material-Web-Components' }
WATagBrush >> onClick: aBlcok if: aBoolean [

	aBoolean ifTrue: [self onClick: aBlcok]
]
