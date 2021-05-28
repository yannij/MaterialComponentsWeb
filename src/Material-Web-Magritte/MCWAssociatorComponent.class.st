Class {
	#name : #MCWAssociatorComponent,
	#superclass : #MASelectListRowsComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MCWAssociatorComponent >> labelForOption: anObject [

	^ self magritteDescription mcwOptionsClass
		ifNil: [ self magritteDescription labelForOption: anObject ]
		ifNotNil: [ :value |
			anObject mdPrimaryString ]
]

{ #category : #accessing }
MCWAssociatorComponent >> options [

	^ self magritteDescription mcwOptionsClass
		ifNil: [ #() ]
		ifNotNil: [ :value |
			(self mcwApplicationGet repositoryUser selectAll: value) asOrderedCollection ]
]

{ #category : #rendering }
MCWAssociatorComponent >> renderEditorOn: html [

	"html select
		id: self labelId;
		list: self options;
		selected: self value;
		callback: [ :value | self value: value ];
		labels: [ :value | self labelForOption: value ]."

	html unorderedList
		mdcList;
		mdcList_dense_if: true;
		mdcTheme_surface;
		with: [
			self options do: [ :eachItem |
				html listItem
					mdcListItem;
					onClick: ((html jQuery ajax)
						callback: [ self value: eachItem. self answer: nil ];
						onComplete: html javascript refresh);
					with: [
						html span mdcListItem__text; with: (self labelForOption: eachItem) ] ] ]
]

{ #category : #rendering }
MCWAssociatorComponent >> renderEditorOnZZZ: html [

false ifTrue: [ super renderEditorOn: html ].
	html div mdcSelect; mcwFormField; mdcAutoInit: 'MDCSelect';
		with: [
			html hiddenInput on: #string of: self.
			html div mdcSelect__anchor; mdcRippleUpgraded;
				with: [
					html span mdcSelect__ripple.
					html span mdcSelect__dropdownIcon.
					html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
						with: self magritteDescription label.
					html span mdcSelect__selectedTextContainer
						with: [ html span mdcSelect__selectedText; tabIndex: 0 ].
					html span mdcLineRipple ].
			html div mdcSelect__menu; mdcMenu; mdcMenuSurface; mdcAutoInit: 'MDCMenu'; with: [
				html unorderedList mdcList; with: [
					| selectedValue |
					selectedValue := self value.
					self options keysAndValuesDo: [ :index :item |
						| listItem isSelected |
						isSelected := item = selectedValue.
						listItem := html listItem mdcListItem; mdcRole: 'option';
							dataValue: item; tabIndex: -1; ariaSelected: isSelected;
							with: [
								html span mdcListItem__ripple.
								html span mdcListItem__text; with: (self labelForOption: item) ].
						isSelected ifTrue: [ listItem mdcListItem_selected ] ] ] ]
		]

"html select callback: [ :value | self value: value ]"
]

{ #category : #rendering }
MCWAssociatorComponent >> renderViewerOn: html [

	self renderEditorOn: html
]
