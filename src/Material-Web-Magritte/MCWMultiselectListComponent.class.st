Class {
	#name : #MCWMultiselectListComponent,
	#superclass : #MAMultiselectListComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWMultiselectListComponent >> renderEditorOn: html [

	self renderMultiselectListOn: html readonly: false
]

{ #category : #rendering }
MCWMultiselectListComponent >> renderMultiselectListOn: html readonly: readonlyFlag [
	| multiselectTag |

	html label
		style: 'height: 160px';
		mcwFormField;
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				style: 'height: 64px';
				id: self labelId;
				with: self magritteDescription label.

			multiselectTag := html multiSelect
				mdcSelect__nativeControl;
				size: 8;
				style: 'height: 128px';
				id: self labelId;
				list: self availableList;
				selected: self selectedList;
				labels: [ :value | self labelForOption: value ];
				enabled: [ :value | readonlyFlag not ];
				yourself.
			readonlyFlag ifFalse: [
				multiselectTag callback: [ :value | self value: value ] ].

			html textInput mdcTextField__input.
			html span mdcLineRipple  ]

]

{ #category : #rendering }
MCWMultiselectListComponent >> renderViewerOn: html [

	self renderMultiselectListOn: html readonly: true
]
