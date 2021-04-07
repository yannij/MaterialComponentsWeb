Class {
	#name : #MCWColorComponent,
	#superclass : #MCWTextInputComponent,
	#category : 'Material-Web-Magritte'
}

{ #category : #rendering }
MCWColorComponent >> inputType [

	^ 'color'
]

{ #category : #rendering }
MCWColorComponent >> xrenderInputOn: html [
	html colorInput
		id: self labelId;
		on: #string of: self
]
