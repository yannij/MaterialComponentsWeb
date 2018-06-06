rendering
renderExpandIconOnListId: listId on: html
	| button |

	html span
		mdcIconToggle;
		mdcMaterialIcons;
		mdcRippleUpgraded;
		mdcRippleUpgraded__unbounded;
		mdcAutoInit: 'MDCIconToggle';
		mdcRole: 'button';
		tabIndex: 0;
		attributeAt: 'data-toggle-on' put: '{"content": "expand_less", "label": "Show more"}';
		attributeAt: 'data-toggle-off' put: '{"content": "expand_more", "label": "Show less"}';
		style: '--mdc-ripple-fg-size:28.8px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:10px; --mdc-ripple-top:10px;';
		ariaLabel: 'Expand'; 
		onClick: ((html jQuery ajax)
			callback: [self expanded: self expanded not];
			onComplete: ((html jQuery id: listId) load html: [:renderer | self renderListAjaxOn: renderer]));
		with: 'expand_more'.
'aria-pressed="true"'.

	"button := (MCWToolbarMenuIcon materialIcon: (self expanded ifTrue: ['expand_less'] ifFalse: ['expand_more']))
		ariaLabel: 'Expand'; 
		onClickScript: ((html jQuery ajax)
			callback: [self expanded: self expanded not];
			onComplete: ((html jQuery id: listId) load html: [:renderer | self renderListAjaxOn: renderer]));
		yourself.
	html render: button"
