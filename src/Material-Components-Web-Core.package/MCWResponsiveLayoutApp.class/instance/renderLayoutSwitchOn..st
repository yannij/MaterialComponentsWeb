rendering
renderLayoutSwitchOn: html

	html div
		"class: 'mdc-elevation--z2';"
		with: [
			html render: (MCWAnchorTextButton new buttonLabel: 'Mobile'; callback: [self beLayoutStructureMobile]; yourself).
			html render: (MCWAnchorTextButton new buttonLabel: 'Tablet'; callback: [self beLayoutStructureTablet]; yourself).
			html render: (MCWAnchorTextButton new buttonLabel: 'Desktop'; callback: [self beLayoutStructureDesktop]; yourself).
		].
