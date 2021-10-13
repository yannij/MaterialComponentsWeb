Class {
	#name : #MDSDemoSliderPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoSliderPage >> pageInfo [

	^ #(
	'Slider'
	'Sliders let users select from a range of values by moving the slider thumb.'
	'https://material.io/go/design-sliders'
	'https://material.io/components/web/catalog/input-controls/sliders/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-slider'
	)
]

{ #category : #rendering }
MDSDemoSliderPage >> renderDemosOn: html [

	html break; break; break.

	html div mdcSlider; mdcSlider_discrete; mdcAutoInit: 'MDCSlider'; style: 'width: 150px'; with: [
		html textInput mdcSlider__input; type: 'range'; name: 'volume';
			attributeAt: 'min' put: '0';
			attributeAt: 'max' put: '100';
			attributeAt: 'step' put: '10';
			ariaLabel: 'Discrete slider demo';
			value: '50'.
		html div mdcSlider__track; with: [
			html div mdcSlider__track_inactive.
			html div mdcSlider__track_active with: [
				html div mdcSlider__track_activefill ] ].
		html div mdcSlider__thumb; with: [
			html div mdcSlider__valueIndicatorContainer with: [
				html div mdcSlider__valueIndicator; with: [
					html span mdcSlider__valueIndicatorText; with: 50 ] ].
			html div mdcSlider__thumbKnob ] ]
]

{ #category : #rendering }
MDSDemoSliderPage >> renderHeroOn: html [

	html div mdcSlider; mdcSlider_discrete; mdcAutoInit: 'MDCSlider'; style: 'width: 150px'; with: [
		html textInput mdcSlider__input; type: 'range'; name: 'volume';
			attributeAt: 'min' put: '0';
			attributeAt: 'max' put: '100';
			attributeAt: 'step' put: '10';
			ariaLabel: 'Discrete slider demo';
			value: '50'.
		html div mdcSlider__track; with: [
			html div mdcSlider__track_inactive.
			html div mdcSlider__track_active with: [
				html div mdcSlider__track_activefill ] ].
		html div mdcSlider__thumb; with: [
			html div mdcSlider__valueIndicatorContainer with: [
				html div mdcSlider__valueIndicator; with: [
					html span mdcSlider__valueIndicatorText; with: 50 ] ].
			html div mdcSlider__thumbKnob ] ]
]
