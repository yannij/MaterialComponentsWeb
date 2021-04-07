Class {
	#name : #MCWCssRenderer,
	#superclass : #MAComponentRenderer,
	#category : 'Material-Web-Magritte'
}

{ #category : #rendering }
MCWCssRenderer >> renderContainer: aDescription [ 

	super renderContainer: aDescription

	"html div
		mdcCard;
		style: 'padding: 16px';
		with: [
			super renderContainer: aDescription]"

]

{ #category : #rendering }
MCWCssRenderer >> renderControl: aDescription [

	super renderControl: aDescription
]

{ #category : #rendering }
MCWCssRenderer >> renderElement: aDescription [

	"html mdlCell
		style: 'margin: 0';
		size: 12;
		tabletSize: 8;
		phoneSize: 4;
		stretch;
		with: [ super renderElement: aDescription ]."

	"html div class: 'mdc-form-field'; with: [
		super renderElement: aDescription]"
	super renderElement: aDescription

]

{ #category : #rendering }
MCWCssRenderer >> renderGroup: aDescription [

	super renderGroup: aDescription.

	"group isNil ifTrue: [ ^ self ].
	html definitionTerm
		class: 'group';
		with: group"
]

{ #category : #rendering }
MCWCssRenderer >> renderLabel: aDescription [
	"Do nothing. #renderElementOn: also does the label"
]

{ #category : #visiting }
MCWCssRenderer >> visitAll: aCollection [

	"super visitAll: aCollection"
	aCollection do: [ :each | self visit: each ] separatedBy: [ self visitDivider ]
]

{ #category : #visiting }
MCWCssRenderer >> visitDivider [

	"html html: '<hr class=""mdc-list-divider"">'"
	"html div
		style: 'line-height: 8px';
		with: [html space]"
]
