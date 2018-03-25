rendering
renderDrawerOn: html
	| list1 list2 |

	list1 := {'inbox' -> 'Inbox'. 'star' -> 'Star'. 'send' -> 'Sent Mail'. 'drafts' -> 'Drafts'}.
	list2 := {'email' -> 'All Mail'. 'delete' -> 'Trash'. 'report' -> 'Spam'}.

	html aside class: 'mdc-drawer'; class: 'mdc-drawer--persistent demo-drawer'; with: [
		html navigation class: 'mdc-drawer__drawer';
			onClick: (JSScript new add: (JSStream new
				nextPutAll: '
var activatedClass = ''mdc-list-item--selected'';
var el = event.target;
while (el && !el.classList.contains(''mdc-list-item'')) {
	el = el.parentElement;
}
if (el) {
	var activatedItem = document.querySelector(''.'' + activatedClass);
	if (activatedItem) {
		activatedItem.classList.remove(activatedClass);
	}
	event.target.classList.add(activatedClass);
}'));
			with: [
			"html div class: 'mdc-drawer__toolbar-spacer'."
			html div class: 'mdc-list-group'; with: [
				self renderList: list1 selectedIndex: 1 on: html].
				html horizontalRule class: 'mdc-list-divider'.
				self renderList: list2 selectedIndex: 0 on: html]].
