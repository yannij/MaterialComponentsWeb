rendering
renderButtonsOn: html

	html div mdcCard__actions; with: [
		html span mdcTypography__subtitle2; with: [html text: self decoratedComponent model mdPrimaryString].
		"html div mdcCard__actionButtons; with: [
			html button
				mdcButton;
				mdcCard__action;
				mdcCard__action_button;
				mdcRippleUpgraded;
				mdcAutoInit: 'MDCRipple';
				callback: [self execute: #save];
				with: 'Save'.
			html button
				mdcButton;
				mdcCard__action;
				mdcCard__action_button;
				mdcRippleUpgraded;
				mdcAutoInit: 'MDCRipple';
				callback: [self execute: #cancel];
				with: 'Cancel']."
		html div mdcCard__actionIcons; with: [
			html div
				mdcIconToggle; mdcMaterialIcons; mdcCard__action; mdcCard__actionIcon; mdcRole: 'button';
				mdcRippleSurface; mdcRippleUpgraded__unbounded; mdcRippleUpgraded; mdcAutoInit: 'MDCRipple';
				style: '--mdc-ripple-fg-size:28.8px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:10px; --mdc-ripple-top:10px;';
				"onClick: (html jQuery this closest: 'form'; triggerSubmit);
				callback: [self execute: #save];"
				onClick: (html jQuery post serializeForm);
				onClick: ((html jQuery ajax)
					callback: [self execute: #save];
					onComplete: html javascript refresh);
				with: 'done'.
			html div
				mdcIconToggle; mdcMaterialIcons; mdcCard__action; mdcCard__actionIcon; mdcRole: 'button';
				mdcRippleSurface; mdcRippleUpgraded__unbounded; mdcRippleUpgraded; mdcAutoInit: 'MDCRipple';
				style: '--mdc-ripple-fg-size:28.8px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:10px; --mdc-ripple-top:10px;';
				onClick: ((html jQuery ajax)
					callback: [self execute: #cancel];
					onComplete: html javascript refresh);
				with: 'cancel'.
			]
		]