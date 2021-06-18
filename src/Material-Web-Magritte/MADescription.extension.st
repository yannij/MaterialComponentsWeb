Extension { #name : #MADescription }

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwComponentClass [

	^ self propertyAt: #mcwComponentClass ifAbsent: [ self class mcwComponentClassDefault ]
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwComponentClass: aClass [

	self propertyAt: #mcwComponentClass put: aClass
]

{ #category : #'*Material-Web-Magritte' }
MADescription class >> mcwComponentClassDefault [

	^ nil
]

{ #category : #'*Material-Web-Magritte' }
MADescription class >> mcwDefaultReportColumnClass [

	^ MCWDescribedColumn
]

{ #category : #'*Material-Web-Magritte' }
MADescription >> mcwIsReference [
	"Answer ==true== if the receiver is a reference description."

	^ false
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
