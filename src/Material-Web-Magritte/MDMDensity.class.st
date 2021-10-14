Class {
	#name : #MDMDensity,
	#superclass : #MDMModel,
	#instVars : [
		'density'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MDMDensity >> density [
	^ density
]

{ #category : #accessing }
MDMDensity >> density: anObject [
	density := anObject
]

{ #category : #accessing }
MDMDensity >> densityDescription [
	<magritteDescription>

	^ MANumberDescription new
		accessor: #density;
		default: 0;
		label: 'Density';
		cssClass: 'mcw-textfield';
		priority: 10;
		beInteger;
		min: -3 max: 0;
		mcwSliderStep: 1;
		"mcwComponentClass: MARangeComponent;"
		yourself
]

{ #category : #initialization }
MDMDensity >> initialize [

	super initialize.
	
	self density: -1
]
