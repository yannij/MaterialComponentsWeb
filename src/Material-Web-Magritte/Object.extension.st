Extension { #name : #Object }

{ #category : #'*Material-Web-Magritte' }
Object >> mdPrimaryString [

	^ self printString
]

{ #category : #'*Material-Web-Magritte' }
Object >> mdSecondaryString [

	^ '<', self hash printString, '>'
]
