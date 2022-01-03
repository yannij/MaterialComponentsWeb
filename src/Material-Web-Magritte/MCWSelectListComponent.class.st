Class {
	#name : #MCWSelectListComponent,
	#superclass : #MASelectListComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWSelectListComponent >> renderEditorOn: html [

	self renderFieldOn: html readonly: false
]

{ #category : #rendering }
MCWSelectListComponent >> renderFieldOn: html readonly: readonlyFlag [

	html div class: 'mcw-textfield';  with: [
		self renderSelectOn: html readonly: readonlyFlag ]
]

{ #category : #rendering }
MCWSelectListComponent >> renderSelectDrowdownIconOn: html [

	html span
		style: 'padding-left: calc(100% - 48px)';
		mdcSelect__dropdownIcon; with: [
		html html: '<svg class="mdc-select__dropdown-icon-graphic" viewBox="7 10 10 5" focusable="false">
<polygon class="mdc-select__dropdown-icon-inactive" stroke="none" fill-rule="evenodd" points="7 10 12 15 17 10" />
<polygon class="mdc-select__dropdown-icon-active" stroke="none" fill-rule="evenodd" points="7 15 12 10 17 15" />
</svg>' ]
]

{ #category : #rendering }
MCWSelectListComponent >> renderSelectFilledOn: html readonly: readonlyFlag [
	| element |

	element := html div mdcSelect; mdcAutoInit: 'MDCSelect'; yourself.
	element
		style: 'background: whitesmoke';
		style: 'height: 56px';
		style: 'width: 100%'.
	readonlyFlag ifTrue: [ element mdcSelect_disabled ].
	element
		with: [
			html hiddenInput
				mdcTextField__input; "to avoid error during: MDCTextField.initialize"
				on: #string of: self.
			html div mdcSelect__anchor; mdcRippleUpgraded;
				with: [
					html span mdcSelect__ripple.
					self renderSelectDrowdownIconOn: html.
					html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
						style: 'padding: 0 16px';
						with: self magritteDescription label.
					html span mdcSelect__selectedTextContainer
						with: [ html span mdcSelect__selectedText; tabIndex: 0 ].
					html span mdcLineRipple ].
			html div mdcSelect__menu; mdcMenu; mdcMenuSurface; mdcAutoInit: 'MDCMenu';
				style: 'width: 100%';
				with: [
				html unorderedList mdcDeprecatedList; with: [
					| selectedValue |
					selectedValue := self value.
					self options keysAndValuesDo: [ :index :item |
						| listItem isSelected |
						isSelected := item = selectedValue.
						listItem := html listItem
							mdcDeprecatedListItem;
							mdcRole: 'option';
							dataValue: item;
							ariaSelected: isSelected;
							with: [
								html span mdcListItem__ripple.
								html span mdcDeprecatedListItem__text; with: (self labelForOption: item) ].
						listItem tabIndex: (index = 1 ifTrue: [ 0 ] ifFalse: [ -1 ]).
						isSelected ifTrue: [ listItem mdcListItem_selected ] ] ] ] ]
]

{ #category : #rendering }
MCWSelectListComponent >> renderSelectOn: html readonly: aReadonlyFlag [

	self mdsTextFieldStyleIsFilled
		ifTrue: [ self renderSelectFilledOn: html readonly: aReadonlyFlag ]
		ifFalse: [ self renderSelectOutlinedOn: html readonly: aReadonlyFlag ]
]

{ #category : #rendering }
MCWSelectListComponent >> renderSelectOutlinedOn: html readonly: readonlyFlag [
	| element |

	element := html div mdcSelect; mdcSelect_outlined; mdcAutoInit: 'MDCSelect'; yourself.
	element
		style: 'background: whitesmoke';
		style: 'height: 56px';
		style: 'width: 100%'.
	readonlyFlag ifTrue: [ element mdcSelect_disabled ].
	element
		with: [
			html hiddenInput
				mdcTextField__input; "to avoid error during: MDCTextField.initialize"
				on: #string of: self.
			html div mdcSelect__anchor;
				with: [
					"self renderSelectDrowdownIconOn: html."
					html span mdcNotchedOutline with: [
						html span mdcNotchedOutline__leading.
						html span mdcNotchedOutline__notch; with: [
							html span mdcFloatingLabel;
								id: self labelId;
								with: self magritteDescription label.
						html span mdcNotchedOutline__trailing ] ].
					html span mdcSelect__selectedTextContainer
						with: [ html span mdcSelect__selectedText; tabIndex: 0 ] ].
			html div mdcSelect__menu; mdcMenu; mdcMenuSurface; mdcAutoInit: 'MDCMenu';
				style: 'width: 100%';
				with: [
				html unorderedList mdcDeprecatedList; with: [
					| selectedValue |
					selectedValue := self value.
					self options keysAndValuesDo: [ :index :item |
						| listItem isSelected |
						isSelected := item = selectedValue.
						listItem := html listItem
							mdcDeprecatedListItem;
							mdcRole: 'option';
							dataValue: item;
							ariaSelected: isSelected;
							with: [
								html span mdcListItem__ripple.
								html span mdcDeprecatedListItem__text; with: (self labelForOption: item) ].
						listItem tabIndex: (index = 1 ifTrue: [ 0 ] ifFalse: [ -1 ]).
						isSelected ifTrue: [ listItem mdcListItem_selected ] ] ] ] ]
]

{ #category : #rendering }
MCWSelectListComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true
]
