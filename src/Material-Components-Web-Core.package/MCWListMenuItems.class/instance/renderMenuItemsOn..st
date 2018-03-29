rendering
renderMenuItemsOn: html

	html unorderedList
		mdcList;
		mdcMenu__items;
		mdcRole: 'menu';
		attributeAt: 'aria-hidden' put: 'true';
		with: [
			{'Popup 1'. 'Popup 2'. 'Popup 3'. ''. 'Popup 4...'}
			do: [ :each |
				each isEmpty
					ifTrue: [html render: MCWListItemSeparator new]
					ifFalse: [html render: (MCWListItemPopupMenu new itemText: each)]
				]].
