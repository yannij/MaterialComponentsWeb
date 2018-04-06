rendering
renderList: aList selectedIndex: anIndex on: html

	html navigation class: 'mdc-list'; with: [
		aList doWithIndex: [:each :index | | tag |
			tag := html anchor.
			index = anIndex ifTrue: [tag class: 'mdc-list-item--selected'].
			tag
				url: '#';
				class: 'mdc-list-item'; class: 'demo-drawer-list-item'; with: [
					(html tag: 'i')
						class: 'material-icons'; class: 'mdc-list-item__graphic';
						attributeAt: 'aria-hidden' put: 'true';
						with: [html text: each key].
					html text: each value]]].
