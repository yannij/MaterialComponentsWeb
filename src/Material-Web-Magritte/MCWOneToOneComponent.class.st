Class {
	#name : #MCWOneToOneComponent,
	#superclass : #MAOneToOneComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #testing }
MCWOneToOneComponent class >> isAbstract [
	^ false
]

{ #category : #actions }
MCWOneToOneComponent >> create [

	self chooser: (self editorFor: self selected new)
]

{ #category : #actions }
MCWOneToOneComponent >> edit [

	self chooser: (self editorFor: self value)
]

{ #category : #rendering }
MCWOneToOneComponent >> renderAssociateButtonOn: html [

	html anchor
		mdcMaterialIcons; mdcIconButton; mdcButton__ripple;
		style: 'font-family: Material Icons Outlined';
		tabIndex: 0;
		onClick: ((html jQuery ajax)
			callback: [ self associateToOne ];
			onComplete: html javascript refresh);
		with: 'ballot'

	"html button mdcButton;
		tabIndex: 0;
		onClick: ((html jQuery ajax)
			callback: [ self associate ];
			onComplete: html javascript refresh);
		with: [
			html span mdcMaterialIcons; mdcIconButton__icon; with: 'ballot' ]"
]

{ #category : #rendering }
MCWOneToOneComponent >> renderButtonsOn: html [
]

{ #category : #rendering }
MCWOneToOneComponent >> renderCreateButtonOn: html [

	html anchor
		mdcMaterialIcons; mdcIconButton; mdcButton__ripple;
		tabIndex: 0;
		onClick: ((html jQuery ajax)
			callback: [ self associateToOne ];
			onComplete: html javascript refresh);
		with: 'view_array'
]

{ #category : #rendering }
MCWOneToOneComponent >> renderEditButtonOn: html [

	html anchor
		mdcMaterialIcons; mdcIconButton;
		tabIndex: 0;
		onClick: ((html jQuery ajax)
			callback: [ self edit ];
			onComplete: html javascript refresh);
		with: [ html div mdcButton__ripple; with: 'edit' ]
]

{ #category : #rendering }
MCWOneToOneComponent >> renderEditorOn: html [

	self renderViewerOn: html
]

{ #category : #rendering }
MCWOneToOneComponent >> renderOneItemListOn: html [

	self value ifNil: [
		html unorderedList mdcList; mdcList_twoLine; mdcList_dense; with: [
			html listItem mdcListItem; with: [
				html span mdcListItem__text; with: '** NONE **' ] ].
		^ self ].

	html unorderedList mdcList; mdcList_twoLine; mdcList_dense; with: [
		html listItem
			mdcListItem;
			onClick: ((html jQuery ajax)
				callback: [ self mcwApplicationGet navTo: self value aspect: nil ];
				onComplete: html javascript refresh);
			with: [
				html span mdcListItem__text; with: [
					html text: self value mdPrimaryString.
					html span
						mdcListItem__secondaryText;
						with: self value mdSecondaryString ] ] ]
]

{ #category : #rendering }
MCWOneToOneComponent >> renderViewerOn: html [
	| listId |

	listId := html nextId.

	html div
		mdcListGroup;
		style: 'border-bottom: 1px solid rgba(0, 0, 0, 0.4);';
		style: 'margin: 4px 4px 0 4px';
		style: 'background-color: whitesmoke';
		with: [
			html heading level3; mdcListGroup__subheader; with: [
				html text: self magritteDescription label.
				"self renderEditButtonOn: html."
				self renderAssociateButtonOn: html ].

		html div id: listId; with: [ self renderOneItemListOn: html ] ]
]
