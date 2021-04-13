Class {
	#name : #MCWContainerComponent,
	#superclass : #MAContainerComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #decorating }
MCWContainerComponent >> addForm: aCollection [

	self addDecoration: (MCWFormDecoration buttons: aCollection)
]

{ #category : #private }
MCWContainerComponent >> buildChildren [
	| map newChildren |

	map := self magritteDescription componentClassMap.

	self magritteDescription
		componentClass: MCWContainerComponent;
		do: [ :eachChild | | theClass |
			theClass := map at: eachChild label ifAbsent: [ eachChild mcwComponentClass ].
			eachChild componentClass: theClass ].

	newChildren := self magritteDescription
		inject: Dictionary new
		into: [ :result :each |
			each isVisible ifTrue: [
				| newComponent |
				newComponent := each componentClass memento: self memento description: each parent: self.
				newComponent mcwPostBuild.
				result at: each put: newComponent ].
			result ].

	^ newChildren
]

{ #category : #rendering }
MCWContainerComponent >> renderContentOn: html [

	"| width |

	width := self magritteDescription propertyAt: #cardWidth ifAbsent: [300]."

	"html div
		mdcCard;
		style: 'padding: 16px';
		with: [
			self renderSaveCancelOn: html.
			super renderContentOn: html]"

	super renderContentOn: html

]

{ #category : #actions }
MCWContainerComponent >> save [
	self validate ifFalse: [ ^ self ].
	self commit.
	self model class isVoyageRoot
		ifTrue: [ self session presenter saveObject: self model ].
	self answer: self model
]
