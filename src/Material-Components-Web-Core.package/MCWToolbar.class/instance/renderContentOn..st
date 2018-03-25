rendering
renderContentOn: html

	self isHidden ifTrue: [^self].

	html div
		class: 'mdc-toolbar'; class: 'mdc-elevation--z4';
		"attributeAt: 'dir' put: 'ltr';"
		style: self mcwStyle;
		with: [
			html div class: 'mdc-toolbar__row'; with: [
				html section
					class: 'mdc-toolbar__section'; class: 'mdc-toolbar__section--align-start';
					with: [
						self startSection do: [:eachAnchor |
							self renderAnchor: eachAnchor on: html].
						html span class: 'mdc-toolbar__title'; with: self title].
				html section
					class: 'mdc-toolbar__section'; class: 'mdc-toolbar__section--align-end';
					with: [
						self endSection do: [:eachAnchor |
							self renderAnchor: eachAnchor on: html]]]].
