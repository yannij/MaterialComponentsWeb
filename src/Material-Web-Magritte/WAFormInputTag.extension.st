Extension { #name : #WAFormInputTag }

{ #category : #'*Material-Web-Magritte' }
WAFormInputTag >> on: aSelector ofNoCallback: anObject [

	self value: (anObject perform: aSelector)
]
