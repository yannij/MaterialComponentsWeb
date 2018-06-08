accessing
addListItem: aListItem

	self listItems add: aListItem.
	aListItem list: self
