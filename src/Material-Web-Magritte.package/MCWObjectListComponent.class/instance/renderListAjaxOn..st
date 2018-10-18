rendering
renderListAjaxOn: html

	html unorderedList
		mdcList;
		mdcList_dense;
		mdcList_twoLine;
		"style: 'border: 1px solid rgba(0, 0, 0, 0.1);';"
		with: [
			self value do: [:eachItem |
				html listItem
					mdcListItem;
					with: [
						html span
							mdcListItem_text;
							onClick: ((html jQuery ajax)
								callback: [self onClickBlock value: eachItem];
								onComplete: html javascript refresh);
							with: [
								html text: eachItem mdPrimaryString.
								html span
									mdcListItem__secondaryText;
									with: [html text: eachItem mdDisplaySecondaryString]].
						"html span mdcListItem__meta; with: [
							html span mdcMaterialIcons; mdcAriaHidden: 'true'; with: 'more_vert']"
						]]]