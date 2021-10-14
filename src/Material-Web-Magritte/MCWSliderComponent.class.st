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
MCWSliderComponent >> renderFieldOn: html readonly: aReadOnlyFlag [

	html div
		mdcListGroup;
		style: 'border-bottom: 1px solid rgba(0, 0, 0, 0.4);';
		style: 'margin: 4px 4px 0 4px';
		style: 'background-color: whitesmoke';
		with: [
			html heading level3; mdcListGroup__subheader; with: self magritteDescription label.
			self renderSliderOn: html readonly: aReadOnlyFlag ]
]

{ #category : #rendering }
MCWSliderComponent >> renderSliderOn: html readonly: aReadonlyFlag [

	html div mdcSlider; mdcSlider_discrete; mdcAutoInit: 'MDCSlider'; style: 'width: 150px'; with: [
		html textInput mdcSlider__input; type: 'range';
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
