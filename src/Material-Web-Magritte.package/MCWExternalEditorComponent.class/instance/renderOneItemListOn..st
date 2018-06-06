rendering
renderOneItemListOn: html

	html div
		mdcListGroup;
		style: 'border: 1px solid rgba(0, 0, 0, 0.1);';
		with: [
			html heading level3; mdcListGroup__subheader; with: [
				html text: self magritteDescription label].
			html unorderedList mdcList; mdcList__twoLine; mdcList__dense;
				with: [
					html listItem
						mdcListItem;
						onClick: ((html jQuery ajax)
							callback: [self session presenter setCanvasContent2: self value];
							onComplete: html javascript refresh);
						with: [
							html span mdcListItem__text; with: [
								html text: self value mdPrimaryString.
								html span
									mdcListItem__secondaryText;
									with: [html text: self value mdDisplaySecondaryString]].
							html span mdcListItem__meta; with: [html space].
								"html span mdcListItem__text; with: [super renderViewerOn: html]"].
			]]