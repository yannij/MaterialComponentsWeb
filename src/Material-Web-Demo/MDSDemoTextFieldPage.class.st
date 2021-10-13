Class {
	#name : #MDSDemoTextFieldPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #'page - textfield' }
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

{ #category : #'page - textfield' }
MDSDemoTextFieldPage >> renderHeroOn: html [

	html div class: 'hero'; with: [
		html div with: [
			html space
		]
	]

]

{ #category : #'page - textfield' }
MDSDemoTextFieldPage >> renderPageOn: html [
	| headlineString summaryString resources |

	resources := #(
		'https://material.io/go/design-text-fields'
		'https://material.io/components/web/catalog/input-controls/text-field/'
		'https://github.com/material-components/material-components-web/tree/master/packages/mdc-textfield'
	).
	headlineString := 'Text Field'.
	summaryString := 'Text fields allow users to input, edit, and select text.'.

	self renderHeadline: headlineString summary: summaryString on: html.
	self renderHeroOn: html.
	self renderResources: resources on: html.
	self renderDemos: [ :value | self renderDemosOn: value ] on: html
]
