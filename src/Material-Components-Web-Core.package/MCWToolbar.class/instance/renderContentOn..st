rendering
renderContentOn: html

	self isHidden ifTrue: [^self].

	html div
		mdcToolbar; mdcElevation__z4;
		"attributeAt: 'dir' put: 'ltr';"
		style: self mcwStyle;
		with: [
			html div mdcToolbar__row; with: [
				html section
					mdcToolbar__section; mdcToolbar__sectionAlignStart;
					with: [
						self startSection do: [:eachAnchor |
							self renderAnchor: eachAnchor on: html].
						html span mdcToolbar__title; with: self title].
				html section
					mdcToolbar__section; mdcToolbar__sectionAlignEnd;
					with: [
						self endSection do: [:eachAnchor |
							self renderAnchor: eachAnchor on: html]]]].
