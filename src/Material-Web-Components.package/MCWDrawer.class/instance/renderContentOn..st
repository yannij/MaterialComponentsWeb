rendering
renderContentOn: html
	| drawerTag drawerScript |

	drawerTag := html aside mdcDrawer.
	self isTemporaryDrawer ifTrue: [drawerTag mdcDrawer__temporary].
	self isPersistentDrawer ifTrue: [drawerTag mdcDrawer__persistent].
	self isPermanentAboveToolbarDrawer ifTrue: [drawerTag mdcDrawer__permanent].
	self isPermanentBelowToolbarDrawer ifTrue: [drawerTag mdcDrawer__permanent].

	drawerScript := JSScript new add: (JSStream new
				nextPutAll: 'var ', self id, '=document.getElementById(''', self id, ''');';
				nextPutAll: self id, '.mdcDrawer = new ', self jsDrawerType, '(', self id, ')';
				yourself).
	self isPersistentDrawer 
		ifTrue: [drawerScript nextPutAll: ';', self id, '.mdcDrawer.open = ', self isPersisted printString].
	"self isTemporaryDrawer 
		ifTrue: [drawerScript nextPutAll: ';', self id, '.mdcDrawer.open = true']."

	drawerTag
		id: self id;
		class: self cssClass;
		script: drawerScript;
		with: [
		html navigation
			mdcDrawer__drawer;
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
			html render: self toolbar.
			html render: MCWShrineBranding new.
			"html div mdcDrawer__toolbarSpacer."
			html div mdcListGroup; with: [
				html render: self list]]].
