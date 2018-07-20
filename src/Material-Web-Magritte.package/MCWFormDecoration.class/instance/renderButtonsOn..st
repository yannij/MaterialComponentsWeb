rendering
renderButtonsOn: html
	| showDisabled |

	showDisabled := self decoratedComponent hasPendingChanges.

	html div mdcCard__actions; with: [
		html span mdcTypography_subtitle2; with: [html text: self decoratedComponent model mdPrimaryString].
		html div mdcCard__actionIcons; with: [
			html button
				mdcIconButton; mdcMaterialIcons; mdcCard__action; mdcCard__action_icon;
				mdcRippleUpgraded_unbounded; mdcRippleUpgraded; mdcAutoInit: 'MDCRipple';
				style: '--mdc-ripple-fg-size:28.8px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:10px; --mdc-ripple-top:10px;';
				"onClick: (html jQuery this closest: 'form'; triggerSubmit);
				callback: [self execute: #save];"
				"disabled: showDisabled;"
				onClick: (html jQuery post serializeForm);
				onClick: ((html jQuery ajax)
					callback: [self execute: #save];
					onComplete: html javascript refresh);
				with: 'done'.
			html button
				mdcIconButton; mdcMaterialIcons; mdcCard__action; mdcCard__action_icon;
				mdcRippleSurface; mdcRippleUpgraded_unbounded; mdcRippleUpgraded; mdcAutoInit: 'MDCRipple';
				style: '--mdc-ripple-fg-size:28.8px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:10px; --mdc-ripple-top:10px;';
				"disabled: showDisabled;"
				onClick: ((html jQuery ajax)
					callback: [self execute: #cancel];
					onComplete: html javascript refresh);
				with: 'cancel'.
			]
		]