Extension { #name : #MANumberDescription }

{ #category : #'*Quasar-Magritte' }
MANumberDescription class >> mdqComponentClassDefault [

	^ MDQTextInputComponent
]

{ #category : #'*Quasar-Magritte' }
MANumberDescription >> mdqTableAlign [

	^ self propertyAt: #mdqTableAlign ifAbsent: [ 'right' ]
]
