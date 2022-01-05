Extension { #name : #MADescriptionComponent }

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mcwPostBuild [
	"Subclasses may specialize"
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldBackground [

	^ 'whitesmoke'
	"^ 'var(--mdc-theme-background)'"
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldGap [

	^ 12
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldHeightOf: aCount [
	"Answer height in px, a <aCount> number of text fields"

	^ (56 * aCount) + ((self mdsTextFieldGap + self mdsTextFieldHelperTextHeight) * (aCount - 1))
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldHelperTextHeight [

	^ self mdsTextFieldHelperTextIsOn ifTrue: [ 19 ] ifFalse: [ 0 ]
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldHelperTextIsOn [

	^ false
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldStyleIsFilled [

	^ self mdsTextFieldStyleIsOutlined not
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> mdsTextFieldStyleIsOutlined [

	^ (self session properties at: #mdsTextFieldStyle ifAbsent: [ nil ]) = #outlined
]

{ #category : #'*Material-Web-Magritte' }
MADescriptionComponent >> renderTextFieldHelpTextOn: html [

	self mdsTextFieldHelperTextIsOn ifTrue: [
		html div mdcTextFieldHelperLine; with: [
			html div mdcTextFieldHelperText;
				mdcTextFieldHelperText_persistent;
				with: 'helper text' ] ]
]
