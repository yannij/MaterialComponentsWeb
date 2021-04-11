Class {
	#name : #MCWComponent,
	#superclass : #WAComponent,
	#category : #'Material-Web-Components'
}

{ #category : #initialization }
MCWComponent >> applicationPostInitialize: anApplication [
	"Hook for initialization after application component initialize has finished"
	"The application>>initialize method must invoke #applicationInitialize:,
	becuase #initialize has to invoke 'super initalize', typically."
]

{ #category : #acccessing }
MCWComponent >> applicationRootGet [

	^ self session properties at: #materialSeaside ifAbsent: [ nil ]
]

{ #category : #acccessing }
MCWComponent >> applicationRootSet: anMCWApplication [

	self session properties at: #materialSeaside put: anMCWApplication
]
