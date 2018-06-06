rendering
renderListAjaxOn: html

	self isExpanded not
		ifTrue: [^self].

	html unorderedList
		mdcList;
		mdcList__dense;
		mdcList__twoLine;
		"style: 'border: 1px solid rgba(0, 0, 0, 0.1);';"
		with: [
			self value do: [:eachItem |
				html listItem
					mdcListItem;
					with: [
						html span
							mdcListItem__text;
							onClick: ((html jQuery ajax)
								callback: [self showObnject: eachItem];
								onComplete: html javascript refresh);
							with: [
								html text: eachItem mdPrimaryString.
								html span
									mdcListItem__secondaryText;
									with: [html text: eachItem mdDisplaySecondaryString]].
						"html span mdcListItem__meta; with: [
							html span mdcMaterialIcons; mdcAriaHidden: 'true'; with: 'more_vert']"
						]]]