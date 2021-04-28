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

{ #category : #'*Material-Web-Magritte' }
WAComponent >> mcwDenseView [

	^ self mcwApplicationGet
		ifNil: [ false ]
		ifNotNil: [ :value | value mcwIsResponsiveApplication
			ifTrue: [ value denseView ]
			ifFalse: [ false ] ]
]

{ #category : #'*Material-Web-Magritte' }
WAComponent >> mcwIsResponsiveApplication [

	^ false
]
