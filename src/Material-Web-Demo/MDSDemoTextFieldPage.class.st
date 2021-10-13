Class {
	#name : #MDSDemoTextFieldPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoTextFieldPage >> pageInfo [

	^ #(
	'Text Field'
	'Text fields allow users to input, edit, and select text.'
	'https://material.io/go/design-text-fields'
	'https://material.io/components/web/catalog/input-controls/text-field/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-textfield'
	)
]

{ #category : #rendering }
MDSDemoTextFieldPage >> renderDemosOn: html [
	| labelId |

	html break; break.
	labelId := html nextId.
	html label
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; "mdcFloatingLabel_floatAbove;" mdcAutoInit: 'MDCFloatingLabel';
				id: labelId;
				with: 'Label in correct place'.
			html textInput mdcTextField__input; ariaDescribedBy: labelId; yourself.
			html span mdcLineRipple ].
		
]

{ #category : #rendering }
MDSDemoTextFieldPage >> renderHeroOn: html [
	| labelId |

	labelId := html nextId.
	html label
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; "mdcFloatingLabel_floatAbove;" mdcAutoInit: 'MDCFloatingLabel';
				id: labelId;
				with: 'Label in correct place'.
			html textInput mdcTextField__input; ariaDescribedBy: labelId; yourself.
			html span mdcLineRipple ].
		
]
