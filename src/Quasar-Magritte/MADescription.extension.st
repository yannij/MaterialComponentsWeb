Extension { #name : #MADescription }

{ #category : #'*Quasar-Magritte' }
MADescription >> mdqComponentClass [

	^ self propertyAt: #mdqComponentClass ifAbsent: [ self class mdqComponentClassDefault ]
]

{ #category : #'*Quasar-Magritte' }
MADescription >> mdqComponentClass: aClass [

	self propertyAt: #mdqComponentClass put: aClass
]

{ #category : #'*Quasar-Magritte' }
MADescription class >> mdqComponentClassDefault [

	^ self mcwComponentClassDefault
]

{ #category : #'*Quasar-Magritte' }
MADescription class >> mdqDefaultReportColumnClass [

	^ MDQDescribedColumn
]

{ #category : #'*Quasar-Magritte' }
MADescription >> mdqReportColumnClass [

	^ self propertyAt: #mdqReportColumnClass ifAbsent: [ self class mdqDefaultReportColumnClass ]
]

{ #category : #'*Quasar-Magritte' }
MADescription >> mdqTableAlign [

	^ self propertyAt: #mdqTableAlign ifAbsent: [ 'left' ]
]

{ #category : #'*Quasar-Magritte' }
MADescription >> mdqTableAlign: aClass [

	self propertyAt: #mdqTableAlign put: aClass
]
