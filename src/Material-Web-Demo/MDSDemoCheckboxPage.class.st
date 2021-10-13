Class {
	#name : #MDSDemoCheckboxPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoCheckboxPage >> pageInfo [

	^ #(
	'Checkbox'
	'Checkboxes allow the user to select multiple options from a set.'
	'https://material.io/go/design-checkboxes'
	'https://material.io/develop/web/components/input-controls/checkboxes'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-checkbox'
	)
]

{ #category : #rendering }
MDSDemoCheckboxPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoCheckboxPage >> renderHeroOn: html [

	html html: '<div><div class="mdc-checkbox mdc-checkbox--selected demo-checkbox mdc-checkbox--upgraded mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;"><input type="checkbox" class="mdc-checkbox__native-control" checked=""><div class="mdc-checkbox__background"><svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24"><path class="mdc-checkbox__checkmark-path" fill="none" stroke="white" d="M1.73,12.91 8.1,19.28 22.79,4.59"></path></svg><div class="mdc-checkbox__mixedmark"></div></div><div class="mdc-checkbox__ripple"></div></div><div class="mdc-checkbox demo-checkbox mdc-checkbox--upgraded mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;"><input type="checkbox" class="mdc-checkbox__native-control"><div class="mdc-checkbox__background"><svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24"><path class="mdc-checkbox__checkmark-path" fill="none" stroke="white" d="M1.73,12.91 8.1,19.28 22.79,4.59"></path></svg><div class="mdc-checkbox__mixedmark"></div></div><div class="mdc-checkbox__ripple"></div></div></div>'
]
