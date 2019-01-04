rendering
renderListAnchorOn: html

	html unorderedList
		mdcList;
		mdcList_dense;
		style: 'min-width: 200px';
		with: [
			self value do: [:eachItem |
				html listItem
					with: [
						html anchor
							mdcListItem;
							callback: [self onClickBlock value: eachItem];
							with: [
								html text: eachItem mdPrimaryString]]]]