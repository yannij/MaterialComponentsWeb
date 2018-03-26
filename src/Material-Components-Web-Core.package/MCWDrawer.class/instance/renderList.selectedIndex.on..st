rendering
renderList: aList selectedIndex: anIndex on: html

	html navigation mdcList; with: [
		aList doWithIndex: [:each :index | | tag |
			tag := html anchor.
			index = anIndex ifTrue: [tag mdcListItem__selected].
			tag
				url: '#';
				mdcListItem; with: [
					(html tag: 'i')
						mdcMaterialIcons; mdcListItem__graphic;
						attributeAt: 'aria-hidden' put: 'true';
						with: [html text: each key].
					html text: each value]]].
