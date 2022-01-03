Extension { #name : #MADescriptionComponent }

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mcwPostBuild [
	"Subclasses may specialize"
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldGap [

	^ 12
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldHeightOf: aCount [
	"Answer height in px, a <aCount> number of text fields"

	^ (56 * aCount) + (self mdsTextFieldGap * (aCount - 1))
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldStyleIsFilled [

	^ self mdsTextFieldStyleIsOutlined not
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldStyleIsOutlined [

	^ (self session properties at: #mdsTextFieldStyle ifAbsent: [ nil ]) = #outlined
]
