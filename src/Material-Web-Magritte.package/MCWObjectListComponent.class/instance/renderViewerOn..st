rendering
renderViewerOn: html
	| listId |

	listId := html nextId.

	html div
		mdcListGroup;
		style: 'border: 1px solid rgba(0, 0, 0, 0.1);';
		"style: 'width: 400px';"
		with: [
			html heading level3; mdcListGroup__subheader; with: [
				html text: self magritteDescription label].

		html div id: listId; with: [self renderListOn: html]
	]