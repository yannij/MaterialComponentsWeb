Class {
	#name : #MCWMultiselectListComponent,
	#superclass : #MAMultiselectListComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWMultiselectListComponent >> renderEditorOn: html [

	self renderFieldOn: html readonly: false
]

{ #category : #rendering }
MCWMultiselectListComponent >> renderFieldOn: html readonly: readonlyFlag [
	| element lines gap |

	lines := 2.
	element := html div yourself.
	gap := 2.
	element
		style: 'background: whitesmoke';
		style: 'height: ', ((56 * lines) + (gap * (lines - 1))) printString, 'px';
		style: 'width: calc(100% - 8px)';
		style: 'margin: 2px 4px';
		with: [
			html span mdcTextField__ripple.
			html span mdcTypography_subtitle1;
				style: 'position: absolute; transform: scale(0.75); color: rgba(0, 0, 0, 0.6);';
			"html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';"
				id: self labelId;
				with: self magritteDescription label.
			self renderMultiselectListOn: html readonly: readonlyFlag.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWMultiselectListComponent >> renderMultiselectListOn: html readonly: readonlyFlag [
	| multiselectTag |

	multiselectTag := html multiSelect
		mdcSelect__nativeControl;
		size: 8;
		style: 'width: 100%';
		style: 'height: calc(100% - 24px)';
		style: 'margin-top: 24px';
		id: self labelId;
		list: self availableList;
		selected: self selectedList;
		labels: [ :value | self labelForOption: value ];
		enabled: [ :value | readonlyFlag not ];
		yourself.
	readonlyFlag ifFalse: [
		multiselectTag callback: [ :value | self value: value ] ].

	html textInput mdcTextField__input
]

{ #category : #rendering }
MCWMultiselectListComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true
]
