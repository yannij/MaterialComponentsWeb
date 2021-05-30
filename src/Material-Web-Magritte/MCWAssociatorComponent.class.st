Class {
	#name : #MCWAssociatorComponent,
	#superclass : #MASelectListRowsComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MCWAssociatorComponent >> labelForOption: anObject [

	^ self magritteDescription mcwOptionsClass
		ifNil: [ self magritteDescription labelForOption: anObject ]
		ifNotNil: [ :value | anObject mdPrimaryString ]
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
MCWAssociatorComponent >> renderViewerOn: html [

	self renderEditorOn: html
]
