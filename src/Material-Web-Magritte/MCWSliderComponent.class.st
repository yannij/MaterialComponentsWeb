Class {
	#name : #MCWSliderComponent,
	#superclass : #MCWTextInputComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWSliderComponent >> renderEditorOn: html [

	self renderFieldOn: html readonly: false
]

{ #category : #rendering }
MCWSliderComponent >> renderFieldOn: html readonly: readonlyFlag [
	| labelTag |

	labelTag := html label.
	self magritteDescription currentCssClasses do: [ :eachCssClass | labelTag class: eachCssClass ].
	labelTag mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		style: 'height: ', ((56 * 2) + 2) printString, 'px';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: self labelId;
				with: self magritteDescription label.
			self renderSliderOn: html readonly: readonlyFlag.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWSliderComponent >> renderSliderOn: html readonly: aReadonlyFlag [

	html div mdcSlider; mdcSlider_discrete; mdcAutoInit: 'MDCSlider'; style: 'width: 80%'; with: [
		html textInput
			mdcSlider__input;
			mdcTextField__input; "to avoid error during: MDCTextField.initialize"
			type: 'range';
			attributeAt: 'min' put: (self magritteDescription min ifNil: [ 0 ] ifNotNil: [ :value | value ]);
			attributeAt: 'max' put: (self magritteDescription max ifNil: [ 100 ] ifNotNil: [ :value | value ]);
			attributeAt: 'step' put: self magritteDescription mcwSliderStep;
			tabIndex: 0;
			"ariaLabel: 'Select Value';"
			readonly: aReadonlyFlag;
			on: self inputAspect of: self;
			yourself.
		html div mdcSlider__track; with: [
			html div mdcSlider__track_inactive.
			html div mdcSlider__track_active with: [
				html div mdcSlider__track_activefill ] ].
		html div mdcSlider__thumb; with: [
			html div mdcSlider__valueIndicatorContainer with: [
				html div mdcSlider__valueIndicator; with: [
					html span mdcSlider__valueIndicatorText; with: self magritteDescription value ] ].
			html div mdcSlider__thumbKnob ] ].

]

{ #category : #rendering }
MCWSliderComponent >> renderViewerOn: html [

	self renderFieldOn: html readonly: true
]
