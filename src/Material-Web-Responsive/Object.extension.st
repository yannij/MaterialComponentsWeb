Extension { #name : #Object }

{ #category : #'*Material-Web-Responsive' }
Object >> mdColorCode [

	^ Color lightGray
]

{ #category : #'*Material-Web-Responsive' }
Object >> mdIcon [

	^ nil
]

{ #category : #'*Material-Web-Responsive' }
Object >> mdImageUrl [

	^ nil
]

{ #category : #'*Material-Web-Responsive' }
Object >> mdPrimaryString [

	^ self printString
]

{ #category : #'*Material-Web-Responsive' }
Object >> mdSecondaryString [

	^ '<', self hash printString, '>'
]

{ #category : #'*Material-Web-Responsive' }
Object >> mdTertiaryString [

	^ ''
]
