Class {
	#name : #MCWBasicLayoutLibrary,
	#superclass : #WAFileLibrary,
	#instVars : [
		'colorThemeCss'
	],
	#category : #'Material-Web-Demo'
}

{ #category : #accessing }
MCWBasicLayoutLibrary >> colorThemeCss [
	^ colorThemeCss
]

{ #category : #accessing }
MCWBasicLayoutLibrary >> colorThemeCss: anObject [
	colorThemeCss := anObject
]

{ #category : #initialization }
MCWBasicLayoutLibrary >> initialize [

	super initialize.

	self colorThemeCss: ''

]

{ #category : #accessing }
MCWBasicLayoutLibrary >> selectorsToInclude [
	"| list |

	list := OrderedCollection new.
	self colorThemeCss notEmpty ifTrue: [list add: #colorThemeCss].
	^list"

	^ #(colorThemeCss)
]
