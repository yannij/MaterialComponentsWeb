Extension { #name : #MAReferenceDescription }

{ #category : #'*Material-Web-Magritte' }
MAReferenceDescription >> mcwIsReference [
	"Answer ==true== if the receiver is a reference description."

	^ true
]

{ #category : #'*Material-Web-Magritte' }
MAReferenceDescription >> mcwIsToMany [
	"Answer ==true== if the receiver is a description for a one to one relationship."

	^ false
]

{ #category : #'*Material-Web-Magritte' }
MAReferenceDescription >> mcwIsToOne [
	"Answer ==true== if the receiver is a description for a one to one relationship."

	^ false
]
