rendering
renderWithRippleOn: html
	| htmlId |

	htmlId := self id ifNil: [html nextId].
	html button
		id: htmlId;
		class: 'mdc-fab material-icons';
		class: 'mdc-fab--mini' if: self isMiniFab;
		class: 'ripple-upgraded mdc-ripple-upgraded--foreground-activation';
		style: '--mdc-ripple-fg-size:33.6px; --mdc-ripple-fg-scale:2.65464; --mdc-ripple-fg-translate-start:19.606px, 0.938037px; --mdc-ripple-fg-translate-end:11.2px, 11.2px;';
		style: 'position: absolute; right: 1rem; z-index: 1';
		style: self bottomStyle;
		attributeAt: 'data-mdc-auto-init' put: 'MDCRipple';
		"script: (JSScript new add: (JSStream new
				nextPutAll: 'mdc.ripple.MDCRipple.attachTo(document.getElementById(''';
				nextPutAll: htmlId;
				nextPutAll: '''))'));"
		with: [
			html span class: 'mdc-fab__icon'; with: 'add'].
