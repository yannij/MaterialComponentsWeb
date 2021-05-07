Class {
	#name : #MDCDensity,
	#superclass : #MCWModel,
	#instVars : [
		'density'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDCDensity >> density [
	^ density
]

{ #category : #accessing }
MDCDensity >> density: anObject [
	density := anObject
]

{ #category : #accessing }
MDCDensity >> densityDescription [
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
		mcwComponentClass: MATextInputComponent;
		yourself
]

{ #category : #initialization }
MDCDensity >> initialize [

	super initialize.
	
	self density: 1
]
