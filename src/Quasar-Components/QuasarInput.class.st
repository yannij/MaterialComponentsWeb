Class {
	#name : #QuasarInput,
	#superclass : #QuasarTag,
	#category : #'Quasar-Components'
}

{ #category : #callbacks }
QuasarInput >> callback: aBlock [

	self name: (self storeCallback: (WAValueCallback on: aBlock))
]

{ #category : #attributes }
QuasarInput >> disable [
	
	self attributes at: 'disable' put: true
]

{ #category : #attributes }
QuasarInput >> disable: aBoolean [
	
	self attributes at: 'disable' put: aBoolean
]

{ #category : #attributes }
QuasarInput >> filled [
	
	self attributes at: 'filled' put: true
]

{ #category : #attributes }
QuasarInput >> label: anObject [
	
	self attributes at: 'label' put: anObject
]

{ #category : #attributes }
QuasarInput >> modelValue: anObject [
	
	self attributes at: 'model-value' put: anObject
]

{ #category : #attributes }
QuasarInput >> name: anObject [
	
	self attributes at: 'name' put: anObject
]

{ #category : #callbacks }
QuasarInput >> on: aSelector of: anObject [

	"self value: (anObject perform: aSelector)."
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSelector asMutator)
]

{ #category : #attributes }
QuasarInput >> outlined [
	
	self attributes at: 'outlined' put: true
]

{ #category : #attributes }
QuasarInput >> readonly: aBoolean [
	
	self attributes at: 'readonly' put: aBoolean
]

{ #category : #accessing }
QuasarInput >> tag [

	^ 'q-input'
]

{ #category : #attributes }
QuasarInput >> type: anObject [
	
	self attributes at: 'type' put: anObject
]

{ #category : #attributes }
QuasarInput >> vModel: anObject [
	
	self attributes at: 'v-model' put: anObject
]
