rendering
renderContentOn: html
	| tag |

	self isHidden ifTrue: [^self].

	tag := html header mdcTopAppBar.

	self isDense ifTrue: [tag mdcTopAppBar_dense].
	self isShort ifTrue: [tag mdcTopAppBar_short].
	self isShortCollapsed ifTrue: [tag mdcTopAppBar_shortCollapsed].

	tag
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
