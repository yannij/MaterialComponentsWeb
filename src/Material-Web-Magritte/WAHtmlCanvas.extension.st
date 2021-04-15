Extension { #name : #WAHtmlCanvas }

{ #category : #'*Material-Web-Magritte' }
WAHtmlCanvas >> path [
	"Defines a path tag used slong with svg tag."

	^ self brush: (WAGenericTag tag: 'path')
]

{ #category : #'*Material-Web-Magritte' }
WAHtmlCanvas >> path: aBlock [
	self path with: aBlock
]

{ #category : #'*Material-Web-Magritte' }
WAHtmlCanvas >> svg [
	"Defines a Scalable Vector Graphics."

	^ self brush: (WAGenericTag tag: 'svg')
]

{ #category : #'*Material-Web-Magritte' }
WAHtmlCanvas >> svg: aBlock [
	self svg with: aBlock
]
