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
			self renderDrawerHeaderOn: html.
			self renderDrawerContentOn: html].

	self isTemporaryDrawer ifTrue: [html div class: 'mdc-drawer-scrim'].
