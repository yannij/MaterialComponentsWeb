rendering
renderExpandIconOnListId: listId on: html
	| toggleOnValue toggleOffValue |

	"TODO: if initial value could be set, then don't need following toggle values"
	self expanded
		ifTrue: [
			toggleOnValue := '{"content": "expand_more", "label": "Show more"}'.
			toggleOffValue := '{"content": "expand_less", "label": "Show less"}']
		ifFalse: [
			toggleOffValue := '{"content": "expand_more", "label": "Show more"}'.
			toggleOnValue := '{"content": "expand_less", "label": "Show less"}'].

	html span
		"mdcIconToggle;"
		mdcMaterialIcons;
		mdcRippleUpgraded;
		mdcRippleUpgraded_unbounded;
		mdcAutoInit: 'MDCIconToggle';
		mdcRole: 'button';
		tabIndex: 0;
		attributeAt: 'data-toggle-on' put: toggleOnValue;
		attributeAt: 'data-toggle-off' put: toggleOffValue;
		style: '--mdc-ripple-fg-size:28.8px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:10px; --mdc-ripple-top:10px;';
		ariaLabel: 'Expand'; 
		onClick: ((html jQuery ajax)
			callback: [self expanded: self expanded not];
			onComplete: ((html jQuery id: listId) load html: [:renderer | self renderListAjaxOn: renderer]));
		with: (self expanded ifTrue: ['expand_less'] ifFalse: ['expand_more']).
