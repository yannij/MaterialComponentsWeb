rendering
renderContentOn: html
	| tag |

	tag := html anchor.
	self selected ifTrue: [tag mdcListItem_selected].
	tag
		mdcListItem;
		mdcRole: 'listitem';
		callback: self callback;
		with: [
			html span mdcListItem__graphic with: [html image url: self imageName].
			html span mdcListItem__text with: [
				html text: self itemText.
				html span mdcListItem__secondaryText; with: self itemSecondaryText]]