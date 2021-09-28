Class {
	#name : #MCWExternalEditorComponent,
	#superclass : #MAExternalEditorComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWExternalEditorComponent >> renderButtonsOn: html [
]

{ #category : #rendering }
MCWExternalEditorComponent >> renderCreateButtonOn: html [

	html anchor
		mdcMaterialIcons; mdcIconButton;
		tabIndex: 0;
		onClick: ((html jQuery ajax)
			callback: [ self create ];
			onComplete: html javascript refresh);
		with: [ html div mdcButton__ripple; with: 'create' ]
]

{ #category : #rendering }
MCWExternalEditorComponent >> renderEditButtonOn: html [

	html anchor
		mdcMaterialIcons; mdcIconButton;
		tabIndex: 0;
		onClick: ((html jQuery ajax)
			callback: [ self edit ];
			onComplete: html javascript refresh);
		with: [ html div mdcButton__ripple; with: 'edit' ]
]

{ #category : #rendering }
MCWExternalEditorComponent >> renderEditorOn: html [

	self renderViewerOn: html
]

{ #category : #rendering }
MCWExternalEditorComponent >> renderMagritteViewerOn: html [

	html div
		mdcTextField;
		"mdcTextField_fullwidth;"
		with: [
			html label
				for: self labelId;
				mdcFloatingLabel;
				mdcFloatingLabel_floatAbove;
				with: self magritteDescription label.
			"html textInput
				readonly: true;
				mdcTextField__input;
				id: self labelId; type: 'text'; with: ''."
			html div id: self labelId; with: [ super renderViewerOn: html ] ]
]

{ #category : #rendering }
MCWExternalEditorComponent >> renderOneItemListOn: html [

	html unorderedList mdcList; mdcDeprecatedList_twoLine; mdcDeprecatedList_dense;
		with: [
			html listItem
				mdcListItem;
				onClick: ((html jQuery ajax)
					callback: [ self mcwApplicationGet navTo: self value aspect: nil ];
					onComplete: html javascript refresh);
				with: [
					html span mdcDeprecatedListItem__text; with: [
						html text: self value mdPrimaryString.
						html span
							mdcListItem__secondaryText;
							with: self value mdSecondaryString ].
					"html span mdcListItem__meta; with: [ html space ]" ] ]
]

{ #category : #rendering }
MCWExternalEditorComponent >> renderViewerOn: html [
	| listId |

	listId := html nextId.

	html div
		mdcListGroup;
		style: 'border: 1px solid rgba(0, 0, 0, 0.1);';
		with: [
			html heading level3; mdcListGroup__subheader; with: [
				html text: self magritteDescription label.
				self isReadonly ifFalse: [
					self renderEditButtonOn: html.
					self renderCreateButtonOn: html ] ].

		html div id: listId; with: [ self renderOneItemListOn: html ] ]
]
