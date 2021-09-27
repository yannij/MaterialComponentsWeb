Extension { #name : #WATagBrush }

{ #category : #'*Material-Web-Components' }
WATagBrush >> ariaDescribedBy: aString [

	self attributeAt: 'aria-describedby' put: aString
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> ariaLabel: aString [

	self attributeAt: 'aria-label' put: aString
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> ariaSelected: aBoolean [

	self attributeAt: 'aria-selected' put: (aBoolean ifTrue: [ 'true' ] ifFalse: [ 'false' ])
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> dataValue: aString [

	self attributeAt: 'data-value' put: aString
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcAutoInit: aJavaScriptClass [

	self attributeAt: 'data-mdc-auto-init' put: aJavaScriptClass
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcCard__media_16x9 [
	"Add this manually, because string manipulation yielded: mdcCard__media_v169"

	self class: 'mdc-card__media--16-9'
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcElevation_z: anInteger [
	"0 <= anInteger <= 24"

	self class: 'mdc-elevation--z', anInteger printString
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcFab__icon: aBlockOrString [

	self mdcFab__icon; with: aBlockOrString
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcFab_mini_if: aBoolean [

	self class: 'mdc-fab--mini' if: aBoolean
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcLayoutGrid__cell_order: anOrderNumber [
	"1 <= aSpanNumber <= 12"

	self class: 'mdc-layout-grid__cell--order-', anOrderNumber printString
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcLayoutGrid__cell_span: aSpanNumber [
	"1 <= aSpanNumber <= 12"

	self class: 'mdc-layout-grid__cell--span-', aSpanNumber printString
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcList_dense_if: aBoolean [

	aBoolean ifTrue: [ self mdcList_dense ]
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcPerform: mdcSelector if: aBoolean [

	aBoolean ifTrue: [ self perform: mdcSelector ]
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcRole: aRole [

	self attributeAt: 'role' put: aRole
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcStyle: aString if: aBoolean [

	aBoolean ifTrue: [ self style: aString ]
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcTopAppBar_denseFixedAdjust_if: aBoolean [

	aBoolean ifTrue: [ self mdcTopAppBar_denseFixedAdjust ]
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcTopAppBar_dense_if: aBoolean [

	aBoolean ifTrue: [ self mdcTopAppBar_dense ]
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> mdcTopAppBar_fixedAdjust_if: aBoolean [

	aBoolean ifTrue: [ self mdcTopAppBar_fixedAdjust ]
]

{ #category : #'*Material-Web-Components' }
WATagBrush >> onClickScript: aBlock if: aBoolean [
	"Same as onClick:if: but avoids name clash with other package extensions"

	aBoolean ifTrue: [ self onClick: aBlock ]
]
