rendering
renderListSingleLineAjaxOn: html

	html unorderedList
		mdcList;
		mdcList_dense;
		style: 'min-width: 200px';
		with: [
			self value do: [:eachItem |
				html listItem
					mdcListItem;
					with: [
						html span
							mdcListItem__text;
							onClick: ((html jQuery ajax)
								callback: [self onClickBlock value: eachItem];
								onComplete: html javascript refresh);
							with: [
								html text: eachItem mdPrimaryString]]]]