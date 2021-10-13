Class {
	#name : #MDSDemoSelectPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoSelectPage >> pageInfo [

	^ #(
	'Select'
	'Selects allow users to select from a single-option menu. It functions as a wrapper around the browser''s native <select> element.'
	'https://material.io/go/design-text-fields'
	'https://material.io/components/web/catalog/input-controls/select-menus/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-slider'
	)
]

{ #category : #rendering }
MDSDemoSelectPage >> renderDemosOn: html [
	| selectedIndex |

	html break; break.
	selectedIndex := 2.
	html div
		mdcSelect; mdcAutoInit: 'MDCSelect';
		with: [
			html div
				mdcSelect__anchor;
				mdcRippleUpgraded;
				with: [
					html span mdcSelect__ripple.
					html span mdcSelect__dropdownIcon; style: 'background: url("data:image/svg+xml;charset=utf-8,%3Csvg width=''10'' height=''5'' viewBox=''7 10 10 5'' xmlns=''http://www.w3.org/2000/svg''%3E%3Cpath fill-rule=''evenodd'' opacity=''.54'' d=''M7 10l5 5 5-5z''/%3E%3C/svg%3E") no-repeat 50%';
						"style: 'left: auto; right: 8px; position: absolute; bottom: 8px;';"
						yourself.
					html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel'; with: 'Fruit'.
					html span mdcSelect__selectedTextContainer with: [ html span mdcSelect__selectedText; tabIndex: 0 ].
					html span mdcLineRipple ].
			html div mdcSelect__menu; mdcMenu; mdcMenuSurface; mdcAutoInit: 'MDCMenu'; with: [
				html unorderedList mdcDeprecatedList; with: [
					{ ''->''. 'apple'->'Apple'. 'orange'->'Orange'. 'banana'->'Banana' } keysAndValuesDo: [ :index :item |
						| listItem isSelected |
						isSelected := index = selectedIndex.
						listItem := html listItem
							mdcDeprecatedListItem;
							ariaSelected: isSelected;
							mdcRole: 'option';
							dataValue: item key;
							with: [
								html span mdcListItem__ripple.
								html span mdcDeprecatedListItem__text; with: item value ].
						index = 1 ifTrue: [ listItem disabled ].
						listItem tabIndex: (index = 1 ifTrue: [ 0 ] ifFalse: [ -1 ]).
						isSelected ifTrue: [ listItem mdcListItem_selected ]  ] ]
				 ] ]
		
]

{ #category : #rendering }
MDSDemoSelectPage >> renderHeroOn: html [

	self renderDemosOn: html
]
