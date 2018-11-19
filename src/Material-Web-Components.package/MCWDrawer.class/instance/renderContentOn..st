rendering
renderContentOn: html
	| drawerTag |

	drawerTag := html aside mdcDrawer.
	self isTemporaryDrawer ifTrue: [drawerTag mdcDrawer_modal].
	self isPersistentDrawer ifTrue: [drawerTag mdcDrawer_dismissible].
	self isPermanentAboveToolbarDrawer ifTrue: [drawerTag mdcDrawer_dismissible].
	self isPermanentBelowToolbarDrawer ifTrue: [drawerTag mdcDrawer_dismissible].

	drawerTag
		id: self id;
		class: (self isPersisted ifTrue: ['mdc-drawer--open'] ifFalse: ['']);
		with: [
		html navigation
			mdcDrawer__drawer;
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

	self isTemporaryDrawer ifTrue: [html div class: 'mdc-drawer-scrim'].
