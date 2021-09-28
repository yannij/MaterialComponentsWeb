Class {
	#name : #MCWSelectListComponent,
	#superclass : #MASelectListComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWSelectListComponent >> renderEditorOn: html [

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
								html span mdcDeprecatedListItem__text; with: (self labelForOption: item) ].
						isSelected ifTrue: [ listItem mdcListItem_selected ] ] ] ]
		]

"html select callback: [ :value | self value: value ]"
]

{ #category : #rendering }
MCWSelectListComponent >> renderViewerOn: html [
				
	| labelTag inputTag |

	labelTag := html label.
	labelTag mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			inputTag := html textInput mdcTextField__input;
				ariaDescribedBy: self labelId;
				type: 'text';
				readonly: true;
				yourself.
			inputTag value: self value.
			html span mdcLineRipple ]
]
