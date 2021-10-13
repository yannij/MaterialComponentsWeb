Class {
	#name : #MDSDemoRadioPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoRadioPage >> pageInfo [

	^ #(
	'Radio Buttons'
	'Buttons communicate an action a user can take. They are typically placed throughout your UI, in places like dialogs, forms, cards, and toolbars.'
	'https://material.io/go/design-radio-buttons'
	'https://material.io/components/web/catalog/input-controls/radio-buttons/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-radio'
	)
]

{ #category : #rendering }
MDSDemoRadioPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoRadioPage >> renderHeroOn: html [

	self renderRadioExampleOn: html
]

{ #category : #rendering }
MDSDemoRadioPage >> renderRadioExampleOn: html [

	html div mdcFormField; style: 'width: 100px'; mdcAutoInit: 'MDCFormField'; with: [
		html div mdcRadio; mdcAutoInit: 'MDCRadio'; with: [
			html textInput mdcRadio__nativeControl; type: 'radio'; id: 'radio1'; name: 'radios'.
			html div mdcRadio__background; with: [
				html div mdcRadio__outerCircle.
				html div mdcRadio__innerCircle ].
			html div mdcRadio__ripple ].
		html label for: 'radio1'; with: 'Radio 1' ].
	html div mdcFormField; style: 'width: 100px'; mdcAutoInit: 'MDCFormField'; with: [
		html div mdcRadio; mdcAutoInit: 'MDCRadio'; with: [
			html textInput mdcRadio__nativeControl; type: 'radio'; id: 'radio2'; name: 'radios'.
			html div mdcRadio__background; with: [
				html div mdcRadio__outerCircle.
				html div mdcRadio__innerCircle ].
			html div mdcRadio__ripple ].
		html label for: 'radio2'; with: 'Radio 2' ]
]
