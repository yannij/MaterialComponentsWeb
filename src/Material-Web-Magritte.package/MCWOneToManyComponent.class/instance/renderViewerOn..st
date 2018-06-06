rendering
renderViewerOn: html
	| listId |

	listId := html nextId.

	html div
		mdcListGroup;
		style: 'border: 1px solid rgba(0, 0, 0, 0.1);';
		with: [
			html heading level3; mdcListGroup__subheader; with: [
				html text: self magritteDescription label.
				self renderAddButtonOn: html.
				self renderExpandIconOnListId: listId on: html.
				].

		html div id: listId; with: [self renderListAjaxOn: html]
	]