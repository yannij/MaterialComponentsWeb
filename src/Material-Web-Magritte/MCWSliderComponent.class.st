Class {
	#name : #MCWSliderComponent,
	#superclass : #MCWTextInputComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWSliderComponent >> renderEditorOn: html [

	self renderViewerOn: html
]

{ #category : #rendering }
MCWSliderComponent >> renderFieldOn: html [

	html label
		style: 'padding-top: 32px';
		mcwFormField;
		mdcTextField; "mdcTextField_filled; " mdcTextField_labelFloating; "mdcAutoInit: 'MDCTextField';"
		with: [
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				style: 'height: 64px';
				id: self labelId;
				with: self magritteDescription label.

			self renderSliderOn: html.

			"html textInput mdcTextField__input."
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWSliderComponent >> renderSliderOn: html [

	html div mdcSlider; mdcSlider_discrete; mdcAutoInit: 'MDCSlider'; style: 'width: 150px'; with: [
		html textInput mdcSlider__input; type: 'range';
			attributeAt: 'min' put: (self magritteDescription min ifNil: [ 0 ] ifNotNil: [ :value | value ]);
			attributeAt: 'max' put: (self magritteDescription max ifNil: [ 100 ] ifNotNil: [ :value | value ]);
			attributeAt: 'step' put: self magritteDescription mcwSliderStep;
			tabIndex: 0;
			ariaLabel: 'Select Value';
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

	self renderFieldOn: html
]
