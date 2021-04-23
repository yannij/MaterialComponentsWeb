Extension { #name : #MANumberDescription }

{ #category : #'*Material-Web-Magritte' }
MANumberDescription >> mcwComponentClass [

	^ MCWSliderComponent

]

{ #category : #'*Material-Web-Magritte' }
MANumberDescription class >> mcwDefaultSliderStep [

	^ 1
]

{ #category : #'*Material-Web-Magritte' }
MANumberDescription >> mcwSliderStep [

	^ self propertyAt: #mcwSliderStep ifAbsent: [ self class mcwDefaultSliderStep ]
]

{ #category : #'*Material-Web-Magritte' }
MANumberDescription >> mcwSliderStep: anObject [

	self propertyAt: #mcwSliderStep put: anObject
]
