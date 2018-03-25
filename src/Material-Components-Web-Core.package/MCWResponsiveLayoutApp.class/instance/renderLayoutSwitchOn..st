rendering - layouts
renderLayoutSwitchOn: html

	html div
		"class: 'mdc-elevation--z2';"
		with: [
			html render: (MCWAnchorButton new buttonLabel: 'Mobile'; callback: [self beLayoutStructureMobile]; yourself).
			html render: (MCWAnchorButton new buttonLabel: 'Tablet'; callback: [self beLayoutStructureTablet]; yourself).
			html render: (MCWAnchorButton new buttonLabel: 'Desktop'; callback: [self beLayoutStructureDesktop]; yourself).
		].
