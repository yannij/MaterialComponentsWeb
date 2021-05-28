Extension { #name : #MADescription }

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwComponentClass [

	^ self propertyAt: #mcwComponentClass ifAbsent: [ self mcwComponentClassDefault ]
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwComponentClass: aClass [

	self propertyAt: #mcwComponentClass put: aClass
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwComponentClassDefault [

	^ nil
]

{ #category : #'*Material-Web-Magritte' }
MADescription class >> mcwDefaultReportColumnClass [

	^ MCWDescribedColumn
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwNavMethodName [

	^ self propertyAt: #mcwNavMethodName ifAbsent: [ nil ]
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwNavMethodName: aMethodName [

	self propertyAt: #mcwNavMethodName put: aMethodName
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwNavPriority [

	^ self propertyAt: #mcwNavPriority ifAbsent: [ nil ]
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwNavPriority: anIndex [

	self propertyAt: #mcwNavPriority put: anIndex
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwOptionsClass [

	^ self propertyAt: #mcwOptionsClass ifAbsent: [ nil ]
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwOptionsClass: aClass [

	self propertyAt: #mcwOptionsClass put: aClass
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwReportColumnClass [

	^ self propertyAt: #mcwReportColumnClass ifAbsent: [ self class mcwDefaultReportColumnClass ]
]
