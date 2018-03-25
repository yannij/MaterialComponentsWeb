rendering
renderAnchor: buttonValues on: html

	html anchor
		class: 'material-icons'; class: 'mdc-toolbar__menu-icon';
		attributeAt: 'aria-label' put: buttonValues first;
		attributeAt: 'alt' put: buttonValues first;
		url: '#';
		onClick: buttonValues third;
		with: buttonValues second.

	buttonValues first = 'More'
		ifTrue: [html render: MCWMenu new]