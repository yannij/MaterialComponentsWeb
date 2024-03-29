Class {
	#name : #MDQOneToOneComponent,
	#superclass : #MAExternalEditorComponent,
	#category : #'Quasar-Magritte'
}

{ #category : #rendering }
MDQOneToOneComponent >> renderButtonsOn: html [
]

{ #category : #rendering }
MDQOneToOneComponent >> renderCreateButtonOn: html [

	html qBtn
		type: 'a'; href: (html urlForAction: [ self create ]);
		icon: 'create'
]

{ #category : #rendering }
MDQOneToOneComponent >> renderEditButtonOn: html [

	html qBtn
		type: 'a'; href: (html urlForAction: [ self edit ]);
		icon: 'edit'
]

{ #category : #rendering }
MDQOneToOneComponent >> renderEditorOn: html [

	self renderViewerOn: html
]

{ #category : #rendering }
MDQOneToOneComponent >> renderViewerOn: html [

	html qCard "class: 'bg-secondary text-white';" with: [
		html qCardSection
			onClick: ((html jQuery ajax)
				callback: [ self mdqApplicationGet navTo: self value aspect: nil ];
				onComplete: html javascript refresh);
			with: [
				html div class: 'text-h6'; with: self value mdPrimaryString.
				html div class: 'text-subtitle2'; with: self value mdSecondaryString ].
		self isReadonly ifFalse: [
			html qSeparator dark.
			html qCardActions "vertical" with: [
				self renderEditButtonOn: html.
				self renderCreateButtonOn: html ] ] ]
]
