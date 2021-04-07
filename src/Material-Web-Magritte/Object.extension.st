Extension { #name : #Object }

{ #category : #'*Material-Web-Magritte' }
Object >> mdDisplaySecondaryString [

	^'<', self hash printString, '>'
]

{ #category : #'*Material-Web-Magritte' }
Object >> mdPrimaryString [

	^self printString
]
