Class {
	#name : #StripeAPI,
	#superclass : #Object,
	#classVars : [
		'Current'
	],
	#category : #'Material-Study-Shrine'
}

{ #category : #accessing }
StripeAPI class >> current [

	^ Current ifNil: [ Current := self new ]
]

{ #category : #accessing }
StripeAPI class >> currentReset [

	Current := nil
]
