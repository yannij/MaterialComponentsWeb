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
	| element |

html div class: 'mcw-textfield'; with: [
	element := html div.
	element
		style: 'background: whitesmoke';
		style: 'height: ', (self mdsTextFieldHeightOf: 2) printString, 'px';
		style: 'width: 100%';
		"style: 'width: calc(100% - 8px)';"
		"style: 'padding-bottom: 12px';"
		with: [
			"html span mdcTextField__ripple."
			html span mdcTypography_subtitle1;
				style: 'position: absolute; transform: scale(0.75); color: rgba(0, 0, 0, 0.6);';
			"html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';"
				id: self labelId;
				with: self magritteDescription label.
			self renderMultiselectListOn: html readonly: readonlyFlag.
			"html span mdcLineRipple" ] ]
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

	"Unused field is here to get the label to align correctly"
	html textInput mdcTextField__input; disabled: true
]

{ #category : #rendering }
MCWMultiselectListComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true
]
