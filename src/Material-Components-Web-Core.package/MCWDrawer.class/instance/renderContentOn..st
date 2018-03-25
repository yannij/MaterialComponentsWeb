rendering
renderContentOn: html

	html aside
		id: self id;
		"style: 'background-color: #EC4E8C';"
		class: 'mdc-drawer'; class: self mdcDrawerClass; class: 'demo-drawer';
		script: (JSScript new add: (JSStream new
				nextPutAll: 'var ', self id, '=document.getElementById(''', self id, ''');';
				nextPutAll: self id, '.mdcDrawer = new ', self jsDrawerType, '(', self id, ')';
				yourself));
		with: [
		html navigation
			attributeAt: 'dir' put: self dir;
			"attributeAt: 'data-mdc-auto-init' put: self jsDrawerType;"
			class: 'mdc-drawer__drawer';
			style: 'background-color: #EC4E8C';
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
			html render: self toolbar.
			"html div class: 'mdc-drawer__toolbar-spacer'."
			html div class: 'mdc-list-group'; with: [
				self renderList: self list selectedIndex: 1 on: html]]].
