Extension { #name : #MADescription }

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwComponentClass [

	^ self propertyAt: #mcwComponentClass ifAbsent: [ self componentClass ]
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwComponentClass: aClass [

	self propertyAt: #mcwComponentClass put: aClass
]
