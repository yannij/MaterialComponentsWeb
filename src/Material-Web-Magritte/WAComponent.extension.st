Extension { #name : #WAComponent }

{ #category : #'*Material-Web-Magritte' }
WAComponent >> layoutCellSpan [

	^ 12
]

{ #category : #'*Material-Web-Magritte' }
WAComponent >> mcwApplicationGet [

	^ self session
		ifNil: [ nil ]
		ifNotNil: [ :value | value presenter ]
]
