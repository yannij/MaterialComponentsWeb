rendering
renderContentOn: html

	self isHidden ifTrue: [^self].

	html div
		mdcToolbar; "mdcElevationZ4;"
		"attributeAt: 'dir' put: 'ltr';"
		style: self mcwStyle;
		with: [
			html div mdcToolbar__row; with: [
				html section
					mdcToolbar__section; mdcToolbar__sectionAlignStart;
					with: [
						self startSection do: [:each | html render: each].
						html span mdcToolbar__title; with: self toolbarTitle].
				html section
					mdcToolbar__section; mdcToolbar__sectionAlignEnd;
					with: [
						self endSection do: [:eachItem | html render: eachItem]]]].
