rendering
renderContentOn: html

	self isHidden ifTrue: [^self].

	html header
		mdcTopAppBar;
		"mdcTopAppBar_short;"
		"mdcTopAppBar_shortCollapsed;"
		mdcAutoInit: 'MDCTopAppBar';
		style: self mcwStyle;
		with: [
			html div mdcTopAppBar__row; with: [
				html section
					mdcTopAppBar__section; mdcTopAppBar__section_alignStart;
					with: [
						self startSection do: [:each | html render: each].
						html span mdcTopAppBar__title; with: self toolbarTitle].
				html section
					mdcTopAppBar__section; mdcTopAppBar__section_alignEnd;
					with: [
						self endSection do: [:eachItem | html render: eachItem]]]].
