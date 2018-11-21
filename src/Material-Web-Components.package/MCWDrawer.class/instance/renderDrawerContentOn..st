rendering
renderDrawerContentOn: html

	html div
		mdcDrawer__content
		with: [
		html navigation
			class: self cssClass;
			attributeAt: 'dir' put: self dir;
			"style: 'background-color: #EC4E8C';"
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
			"html div mdcDrawer__toolbarSpacer."
			html div mdcListGroup; with: [
				html render: self list]]].
