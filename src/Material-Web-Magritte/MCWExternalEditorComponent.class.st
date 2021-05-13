Class {
	#name : #MCWExternalEditorComponent,
	#superclass : #MAExternalEditorComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWExternalEditorComponent >> renderButtonsOn: html [
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

	html div
		mdcListGroup;
		style: 'border: 1px solid rgba(0, 0, 0, 0.1);';
		with: [
			html heading level3; mdcListGroup__subheader; with: [
				html text: self magritteDescription label ].
			html unorderedList mdcList; mdcList_twoLine; mdcList_dense;
				with: [
					html listItem
						mdcListItem;
						onClick: ((html jQuery ajax)
							callback: [ self mcwApplicationGet setCanvasContent2: self value ];
							onComplete: html javascript refresh);
						with: [
							html span mdcListItem__text; with: [
								html text: self value mdPrimaryString.
								html span
									mdcListItem__secondaryText;
									with: [ html text: self value mdSecondaryString ] ].
							html span mdcListItem__meta; with: [ html space ].
								"html span mdcListItem__text; with: [super renderViewerOn: html]" ].
			] ]
]

{ #category : #rendering }
MCWExternalEditorComponent >> renderViewerOn: html [

	self renderOneItemListOn: html
]
