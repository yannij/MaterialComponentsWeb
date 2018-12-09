rendering
renderContentOn: html
	| drawerTag |

	drawerTag := html aside mdcDrawer.
	self isModalDrawer ifTrue: [drawerTag mdcDrawer_modal].
	self isDismissibleDrawer ifTrue: [drawerTag mdcDrawer_dismissible].

	drawerTag
		id: self id;
		class: (self isDrawerOpen ifTrue: ['mdc-drawer--open'] ifFalse: ['']);
		with: [
			self renderDrawerHeaderOn: html.
			self renderDrawerContentOn: html].

	self isModalDrawer ifTrue: [html div class: 'mdc-drawer-scrim'].
